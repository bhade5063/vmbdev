public class OpportunityTriggerHandler {
    
    public static void addOppTeamMembersOfOpportunistRole(List<Opportunity> newOppoRecords, Map<Id, Opportunity> oldMapOppoRecords){
        List<OpportunityTeamMember> oppTeamMemList = new List<OpportunityTeamMember>();
        List<User> opportunist = [SELECT Id, Name, userRole.Name , isActive FROM User WHERE isActive = true AND userRole.Name = 'Opportunist'];
        for(Opportunity opp : newOppoRecords){
            if(opp.StageName == 'Needs Analysis' && opp.StageName != oldMapOppoRecords.get(opp.Id).StageName){
                for(User userRec : opportunist){
                    OpportunityTeamMember oppTeam = new OpportunityTeamMember();
                    oppTeam.OpportunityId = opp.Id;
                    oppTeam.OpportunityAccessLevel = 'Edit';
                    oppTeam.UserId = userRec.Id;
                    oppTeamMemList.add(oppTeam);
                }
            }
        }
        if(!oppTeamMemList.IsEmpty()){
            insert oppTeamMemList;
        }
    }
    
    public static void handleRecordsAfterUpdate(List<Opportunity> newOppoRecords){
        
        List<Task> newListTask = new List<Task>();
        Set<Id> oppIds = new Set<Id>();
        List<OpportunityTeamMember> deleteOppoMemberList = new List<OpportunityTeamMember>();
        
        for(Opportunity oppRec : newOppoRecords){
            oppIds.add(oppRec.Id);
        }
        
        List<OpportunityTeamMember> oppoTeamMem = [SELECT Id, OpportunityId FROM OpportunityTeamMember WHERE OpportunityId IN : oppIds];
        
        for(Opportunity newRecords : newOppoRecords){
            if(newRecords.StageName == 'Closed Won'){
                Task newTask = new Task();
                newTask.Priority = 'High';
                newTask.OwnerId = newRecords.OwnerId;
                newTask.Description = 'Please check the task split among the team to close it';
                newTask.WhatId = newRecords.Id;
                newTask.Subject = 'Split Revenue';
                newListTask.add(newTask);
                
            } else if(newRecords.StageName == 'Closed Lost'){
                for(OpportunityTeamMember teamMember : oppoTeamMem){
                    if(teamMember.OpportunityId == newRecords.Id){
                        deleteOppoMemberList.add(teamMember);
                    }
                }
            }
        }
        
        if(!deleteOppoMemberList.isEmpty()){
            delete deleteOppoMemberList;
        }
        
        if(!newListTask.isEmpty()){
            insert newListTask;
        }
        
    }
    
    public static void handleRecordsBeforeUpdate(List<Opportunity> newOppoRecords, Map<Id, Opportunity> oldMapOppoRecords){
        
        for(Opportunity newOpp : newOppoRecords){
            if(oldMapOppoRecords.get(newOpp.Id).StageName != newOpp.StageName){
                system.debug('stageName has been changed');
                newOpp.Amount = newOpp.Probability * newOpp.ExpectedRevenue;
  
            }
        } 
    }
    
    public static void handleRecordsAfterDelete(List<Opportunity> oldRecords){
        
        Set<Id> accountIds = new Set<Id>();
        Map<Id, Id> oppVsAccountMap = new Map<Id, Id>();
        Map<Id, Id> accVsOwnerMap = new Map<Id, Id>();
        
        for(Opportunity opp : oldRecords){
            accountIds.add(opp.AccountId);
            oppVsAccountMap.put(opp.Id, opp.AccountId);
        }
        
        List<Account> accountRecords = [SELECT Id, OwnerId FROM Account WHERE Id IN : accountIds];
        
        for(Account acc : accountRecords){
            accVsOwnerMap.put(acc.Id, acc.OwnerId);
        }
        
        List<Task> taskSaveRecordList = new List<Task>();
        for(Opportunity oppRecords : oldRecords){
            Task taskRecord = new Task();
            taskRecord.Priority = 'High';
            taskRecord.Description = 'Please check why the opportunity is deleted.';
            taskRecord.Subject = 'FOLLOW UP';
            taskRecord.Status = 'Not Started';
            taskRecord.OwnerId = accVsOwnerMap.get(oppVsAccountMap.get(oppRecords.Id));
            taskSaveRecordList.add(taskRecord);    
        }
        if(!taskSaveRecordList.IsEmpty()){
            insert taskSaveRecordList;
        }
        
    }
}