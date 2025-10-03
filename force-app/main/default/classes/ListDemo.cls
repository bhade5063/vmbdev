public class ListDemo {
    public void methodListDemo(){
        List<String> strList1 = new List<String>();
        List<String> strList2 = new List<String>();
        List<String> strList3 = new List<String>();
        List<Integer> intList2 = new List<Integer>{1,2,4,5,6,7,7,8};
        List<String> strList4 = new List<String>{'Shrinath', 'Kunal', 'Ajay'};
        System.debug('intList2 => ' + intList2);
        System.debug('strList4 => ' + strList4);
        sObject sObj = [SELECT Id, Name FROM Account LIMIT 1];
        List<Integer> intList1 = new List<Integer>();
        Boolean isEquals;
        
        List<Opportunity> oppoList = new List<Opportunity>();
        oppoList = [SELECT Id, Name FROM Opportunity LIMIT 3];
        System.debug('Opportunity List: ' + oppoList);
        
        intList1.add(1);
        intList1.add(23);
        intList1.add(67);
        intList1.add(4);
        intList1.add(5);
        intList1.add(87);
        intList1.add(2);
        intList1.add(24);
        
        strList1.add('MH');
        strList1.add('KA');
        strList1.add('AP');
        strList1.add('DL');
        strList1.add(2,'RJ');
        
        strList2 = strList1.clone();
        isEquals = strList1.equals(strList2);
        strList3.addAll(strList2);
        strList3.addAll(strList1);
       
        System.debug('strList1 => ' + strList1);
        System.debug('isEquals => ' + isEquals);
        System.debug('strList3 => ' + strList3);
        
        System.debug('String Index => ' + strList3.get(2));
        System.debug('Print SObject => ' + sObj);
        System.debug('Object Type => ' + sObj.getSObjectType());
        System.debug('String Index => ' + strList3.indexOf('AP'));
        System.debug('IsEmptyCheck => ' + !strList3.isEmpty());
        System.debug('Size => ' + strList3.size());
        intList1.sort();
        System.debug('Sort => ' + intList1);
    }

}