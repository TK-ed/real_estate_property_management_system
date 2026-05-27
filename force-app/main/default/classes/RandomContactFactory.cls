public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer num, String lName){
        List<Contact> newList = new List<Contact>();
		for (Integer i = 0; i < num; i++) {
            Contact newContact = new Contact();
            newContact.FirstName = 'Test ' + i;
            newContact.LastName = lName;

            newList.add(newContact);
        }
        return newList;
    }
}