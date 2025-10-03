public class CaseTriggerHandler {
    public static void handleEventsBeforeDelete(List<Case> oldRecords){
        Id currentUserProfileId = UserInfo.getProfileId();
        Id systemAdminProfileId = [SELECT Id, Name FROM Profile WHERE Name = 'System Administrator'].Id;
        
        for(Case caseRec : oldRecords){
            if(systemAdminProfileId != currentUserProfileId){
                caseRec.addError('You do NOT have Permission to delete the case');
            }
        }
                                 
    }
}