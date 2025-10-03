public class demoSObjects {
    public void demoObjectMethod(){
        Integer accCount = 1;
        
        Account acc = new Account();
        acc.Name = 'Test Account For sObject Test';
        acc.Phone = '9853435638';
        System.debug('Account Variable OutPut => ' + acc);
        
        Income__c income = new Income__c();
        Income.Name = 'New Income';
        Income.Income_Amount__c = 454;
        System.debug('Income Variable OutPut => ' + income);
        
        sObject conObj;
        conObj = new Contact();
        Contact con = (Contact)conObj;
        con.Email = 'contactprodapt@gmail.com';
        con.Description = 'Contact Prodapt';
        System.debug('Contact sObject OutPut: ' + con);
        
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        accList = [SELECT Id, Name FROM Account LIMIT 4];
        
        if(!accList.isEmpty()){
            for(Account acct : accList){
                accIds.add(acct.Id);
                System.debug('Acccount ' + accCount + ' Id => ' + acct.Id);
                accCount++; 
            }
        }
        
    }
}