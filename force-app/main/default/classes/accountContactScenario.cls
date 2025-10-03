public class accountContactScenario {
    public static void contactCreation(){
        Integer noOfContacts = 3;
        List<Contact> contactList = new List<Contact>();
        Account accountRecord = new Account(Name = 'Tanya Agarwal');
        insert accountRecord;
        if(noOfContacts > 0){
            for(Integer i = 1; i <= noOfContacts; i++){
                Contact con = new Contact(LastName = 'Contact List'+ i, AccountId = accountRecord.Id);
                contactList.add(con);
            }
        }
        insert contactList;
    }
}