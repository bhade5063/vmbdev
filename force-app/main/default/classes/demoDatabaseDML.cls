public class demoDatabaseDML {
    public void demoDatabaseMethod(){
        List<Contact> contactList = new List<Contact>{
            new Contact(FirstName = 'Shantappa', LastName = 'Swami'),
                new Contact(FirstName = 'Surekha', LastName = 'Swami'),
                new Contact()};
                    
                    Database.SaveResult[] srList = Database.insert(contactList, false); //Database.insert(recordList, allOrNone);
        
        for(Database.SaveResult srr : srList){
            if(srr.isSuccess()){
                System.debug('Successfully Inserted Contact Record, Contact Id => ' + srr.getId());
            }else{
                for(Database.Error err : srr.getErrors()){
                    System.debug('Error Occured while inserting the Record...');
                    System.debug(err.getStatusCode() + ':' + err.getMessage());
                    System.debug('Contact Fields that affected this error => ' + err.getFields());
                }
            }
        }
        
        //Upsert
        //Database.upsert(recordList, false);
        //Database.UpserResult[] recordList = Database.upsert(recordList, false);
       
        //delete
        //Database.delete(recordList, false);
        //Database.deletResult[] recordList = Database.delete(recordList, false);
     
        //By default allOrNone variable is true
        //These all are same.
        //insert recordList;
        //Database.insert(recordList);
        //Database.insert(recordList, true);
    }
}