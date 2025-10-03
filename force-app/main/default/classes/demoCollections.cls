public class demoCollections {
    public void demoCollectionsMethod(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name FROM Account LIMIT 4];
        
        Set<Id> accIds = new Set<Id>();
        
        Map<Id, Account> accMap = new Map<Id, Account>(accList);
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                accIds.add(acc.Id);
            }
        }
        
        for(Id i : accIds){
            if(accMap.containsKey(i)){
                System.debug('Map OutPut From Set: ' + accMap.get(i));
            }
        }
    }
}