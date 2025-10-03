public class demoDML {
    public void demoMethodDML(){
        //Insert
        //Account acc = new Account(Name = 'Demo Account4', Phone = '8180008705');
        //insert acc;
        //Contact con = new Contact(FirstName = 'Shrinath', LastName = 'Swami', AccountId = acc.Id);
        //insert con;
        
        //List<Account> accList = new List<Account>();
        //Account acc1 = new Account(Name = 'Demo Account2', Phone = '8180008105');
        //Account acc2 = new Account(Name = 'Demo Account3', Phone = '8180004305');
        //accList.add(acc1);
        //accList.add(acc2);
        //insert accList;
        
        //Update
        //Account acc = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Demo Account'];
        //System.debug('Account => ' + acc);
        
        //acc.Phone = '987654345645';
        //update acc;
       
        
        //Account updatedAcc = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Demo Account'];
        //System.assertEquals(updatedAcc.Phone, acc.Phone, 'Not Equals');
        
        //Contact conRecord = [SELECT Id, FirstName, LastName, Account.Phone FROM Contact WHERE FirstName = 'Shrinath' AND LastName = 'Swami' AND AccountId != null];
        //System.debug('Contact Record => ' + conRecord);
        //conRecord.Phone = '8989898989';
        //conRecord.Account.Phone = '1122334455';
        
        //update conRecord;
        //update conRecord.Account;
        
        //Upsert
        
        //Contact con = new Contact(FirstName = 'Red', LastName = 'Monkey', Phone = '8899000878');
        
        //Account acc = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Demo Account'];
        //con.AccountId = acc.id;
        //upsert acc;
        //upsert con;
       
        
        //Merge
        //Account acc1 = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Account New'];
        //Account acc2 = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Demo Account'];
        
        // Merging acc2 inside acc1.
        //merge acc1 acc2;
        
        //Delete and Undelete.
        //Account acc1 = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Demo Account2'];
        //System.debug('Acc1 => ' + acc1);
        //delete acc1;
        
        //Account deletedAcc1 = [SELECT Id, Name, Phone FROM Account WHERE Name = 'Demo Account2' ALL ROWS];
        //System.debug('deletedAcc1 => ' + deletedAcc1);
        //undelete deletedAcc1;
        
        
        //Exception handling in DML Operations.
        try{
            Account acc = new Account();
            insert acc;
        }catch(DMLException e){
            System.debug('Error => ' + e.getMessage());
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}