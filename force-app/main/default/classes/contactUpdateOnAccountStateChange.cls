public class contactUpdateOnAccountStateChange {
    public static void contactUpdateMethod(){
        Account newAccount = new Account(Name = 'Billing State Update', BillingState = 'Maharashtra');
        List<Account> accountList = new List<Account>();
        
        accountList.add(newAccount);
        
        if(accountList.size() > 0){
            for(Account actList : accountList){

            }
        }
        
    }

}