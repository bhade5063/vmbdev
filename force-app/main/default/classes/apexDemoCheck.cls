public class apexDemoCheck {
    public apexDemoCheck(){
        System.debug('Inside the Constructor');
    }
    public void methodDemo(){
        List<Integer> integerList = new List<Integer>();
        integerList.add(1);
        integerList.add(1);
        integerList.add(2);
        integerList.add(2);
        integerList.add(3);
        integerList.add(3);
        integerList.add(4);
        System.debug('Integer List Values: ' + integerList);
        
        Set<Integer> setInteger = new Set<Integer>(integerList);
        System.debug('Integer Set Values: ' + setInteger);
        
        List<Integer> testIndex = new List<Integer>(setInteger);
        System.debug('First Index Value: ' + testIndex[0]);
        
        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 3];
        System.debug('Account List Values: ' + accountList);
        
        Map<String, Account> newAccountMap = new Map<String, Account>(accountList);
    	System.debug('Account Map Values: ' + newAccountMap);
        
        
    }

}