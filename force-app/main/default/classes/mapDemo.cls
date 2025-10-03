public class mapDemo {
    public void mapDemoMethod(){
        Map<Integer, String> intStrMap = new Map<Integer, String>();
        Integer sizeOfMap;
        String strVariable;
        intStrMap.put(1, 'MH');
        intStrMap.put(2, 'DL');
        intStrMap.put(3, 'MP');
        intStrMap.put(4, 'GJ');
        intStrMap.put(5, 'UP');
        intStrMap.remove(5);
        sizeOfMap = intStrMap.size();
        System.debug('Map Output: ' + intStrMap);
        System.debug('Map Size Output: ' + sizeOfMap);
        System.debug('Map Values Output: ' + intStrMap.values());
        List<String> strList2 = new List<String>();
        strList2 = intStrMap.values();
        System.debug('Map List Values Output: ' + strList2);
        
        System.debug('Map Key Set Output' + intStrMap.keySet());
        Set<Integer> setInteger = new Set<Integer>();
        setInteger = intStrMap.keySet();
        System.debug('Map Set Ouput' + setInteger);
        
        Map<Id, Account> accountIdMap = new Map<Id, Account>([SELECT Id, Name FROM Account LIMIT 2]);
		System.debug('Account Id Map: ' + accountIdMap);        
        
    }
}