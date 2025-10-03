public class ContactTriggerHandler {
    
    public static void handleafterupdateevents(List<Contact> conRecords, Map<Id, Contact> oldMapRecords){
        List<Id> accountIdsToUpdate = new List<Id>();
        for(Contact con : conRecords){
            if(con.AccountId != null){
                if(con.Email != oldMapRecords.get(con.Id).Email || con.Phone != oldMapRecords.get(con.Id).Phone){
                    accountIdsToUpdate.add(con.AccountId);
                }
            }
        }
       	
        List<String> emailsToInform = new List<String>();
        List<Account> AccountRecords = [SELECT OwnerId, Owner.Email FROM Account WHERE Id IN : accountIdsToUpdate];
        For(Account acc : AccountRecords){
            emailsToInform.add(acc.Owner.Email);
        }
        if(!emailsToInform.IsEmpty()){
            List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>(); 
            for(Id accId : accountIdsToUpdate){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSubject('Email or Phone Changed.');
                mail.setplaintextbody('Hi Sir/Madam, Your Email or Phone has been modified successfully.');
                mail.setToAddresses(emailsToInform);
                emailList.add(mail);
            }
            List<Messaging.SendEmailResult> results = Messaging.SendEmail(emailList);
            System.debug('emailResults>>>>>' + results);
        }
    }
    
    
    public static void handleafterinsertevents(List<Contact> conRecords){
        Id conInnoPublicGroupId = [SELECT Id, Name FROM Group WHERE Name = 'Contact Innovators' LIMIT 1].Id;
        List<ContactShare> addConShareList = new List<ContactShare>();
        for(Contact conRec : conRecords){
            ContactShare conShare = new ContactShare();
            conShare.ContactId = conRec.Id;
            conShare.ContactAccessLevel = 'Edit';
            conShare.RowCause = 'Manual';
            conShare.UserOrGroupId = conInnoPublicGroupId;
            addConShareList.add(conShare);
        }
        if(!addConShareList.IsEmpty()){
            insert addConShareList;
        }
    }
    public static void handlebeforeinsertevents(List<Contact> conRecords){
        List<Contact> existingRecords = [SELECT Id, LastName, Phone, Email FROM Contact LIMIT 50000];
        for(Contact newCon : conRecords){
            for(Contact existingCon : existingRecords){
                if(newCon.LastName == existingCon.LastName && newCon.Phone == existingCon.Phone && newCon.Email == existingCon.Email){
                    newCon.addError('Duplicate Found!');
                }
            }
        }  
    }
}