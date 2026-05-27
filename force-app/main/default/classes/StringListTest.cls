public with sharing class StringListTest {
    public static List<String> generateStringList(Integer a) {
        // Create a list of String
        List<String> listStrings = new List<String>();
        
        // Add elements to the list
        for (Integer i = 0; i < a; i++) {  // Use < instead of <= to avoid an out-of-bounds error
            listStrings.add('Test ' + i);  // Use i instead of a to reflect the index
        }
        
        return listStrings;  // Return the list
    }
}