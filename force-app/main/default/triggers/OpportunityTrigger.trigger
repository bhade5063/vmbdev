trigger OpportunityTrigger on Opportunity (after update, before update, after delete) {
    
    if(Trigger.IsAfter && Trigger.IsUpdate){
        OpportunityTriggerHandler.handleRecordsAfterUpdate(Trigger.New);
    }
    
     if(Trigger.IsBefore && Trigger.IsUpdate){
        OpportunityTriggerHandler.handleRecordsBeforeUpdate(Trigger.New, Trigger.oldMap);
        OpportunityTriggerHandler.addOppTeamMembersOfOpportunistRole(Trigger.New, Trigger.oldMap);
    }
    
    if(Trigger.IsAfter && Trigger.IsDelete){
        OpportunityTriggerHandler.handleRecordsAfterDelete(Trigger.OLD);
    }

}