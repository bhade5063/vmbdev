public class AccountTriggerHandler {
    public static void handleAfterInsertEvent(List<Account> newRecords){
        List<Contact> listOfContactsToAdd = new List<Contact>();
        for(Account acc : newRecords){
            if(acc.Number_of_Contacts__c != null){
                for(Integer i = 0 ; i < acc.Number_of_Contacts__c; i++){
                    Contact con = new Contact();
                    con.LastName = acc.Name + ' Number ' + i;
                    con.AccountId = acc.Id;
                    listOfContactsToAdd.add(con);
                }
            }
        }
        if(!listOfContactsToAdd.isEmpty()){
            insert listOfContactsToAdd; 
        }
    }
    
    public static void handleBeforeUpdateEvent(List<Account> newAccRecords, Map<Id, Account> oldMap){
        for(Account accRecords: newAccRecords){
            if(accRecords.Type == 'Prospect' && accRecords.Industry == 'Agriculture'){
                if(oldMap.get(accRecords.Id).Ownership != accRecords.Ownership && accRecords.Ownership == 'Private'){
                    accRecords.addError('Ownership cannot be modified... AccountTriggerHandler');
                }
            }
        }
    }
    
    public static void handleAfterUpdateEvent(List<Account> newAccRecords, Map<Id, Account> oldMap){
        Map<Id, String> conToUpdateMAP = new Map<Id, String>();
        List<Contact> listOfContactsToAdd = new List<Contact>();
        for(Account accRecords : newAccRecords){
            if(accRecords.Number_of_Contacts__c != null){
                for(Integer i = 0 ; i < accRecords.Number_of_Contacts__c; i++){
                    Contact con = new Contact();
                    con.LastName = accRecords.Name + ' Number ' + i;
                    con.AccountId = accRecords.Id;
                    listOfContactsToAdd.add(con);
                }
            }
            
            if(oldMap.get(accRecords.Id).Website != accRecords.Website){
                conToUpdateMAP.put(accRecords.Id, accRecords.Website);   
            }
        }
        
         if(!listOfContactsToAdd.isEmpty()){
            insert listOfContactsToAdd; 
        }
        
        if(conToUpdateMAP.KeySet().size() > 0){
            List<Contact> listConToUpdate = new List<Contact>();
            List<Contact> listContact = [SELECT Id, FirstName, AccountId, Website__c FROM Contact WHERE AccountId IN : conToUpdateMAP.KeySet()];
            for(Contact conRec : listContact){
                conRec.Website__c = conToUpdateMAP.get(conRec.AccountId);
                listConToUpdate.add(conRec);
            }
            if(!listConToUpdate.isEmpty()){
                update listConToUpdate;
            }
        }   
    }
}