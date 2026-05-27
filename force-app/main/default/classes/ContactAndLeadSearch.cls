public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String name) {

        List<List<sObject>> searchResults = [FIND :name
            IN ALL FIELDS
            RETURNING Contact (FirstName,LastName),
            Lead (FirstName, LastName)];

        return searchResults; // Return the list of matching Contacts and Leads
    }
}