public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postalCode) {
        if (String.isEmpty(lastName) || String.isEmpty(postalCode)) {
            throw new IllegalArgumentException('Last name and postal code cannot be empty.');
        }

        List<Contact> matchingContacts = [SELECT Id, Name 
                                           FROM Contact 
                                           WHERE LastName = :lastName 
                                           AND MailingPostalCode = :postalCode];

        return matchingContacts;
    }
}