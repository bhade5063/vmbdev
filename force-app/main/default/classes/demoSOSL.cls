public class demoSOSL {
    public static void demoSOSLMethod(){
        List<List<sObject>> accountList = [FIND 'Account' IN ALL FIELDS RETURNING Account(Name) LIMIT 4];
        System.debug('List of Account fetched by SOSL :' + accountList);
        
        List<Account> actList = accountList[0];
        if(actList.size() > 0){
            Integer i = 1;
            for(Account act : actList){
                System.debug('Account' + i + 'Number' + act.Name);
                    i++;
            }
        }
        
    }
}