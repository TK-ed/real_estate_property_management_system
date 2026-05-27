@IsTest
private class TestRestrictContactByName {

    /**
     * @description Tests the trigger's behavior when inserting a Contact with an invalid last name.
     * Expected: An DML exception with the custom error message.
     */
    @isTest
    static void testInsertWithInvalidLastName() {
        // Create a contact with the invalid last name
        Contact invalidContact = new Contact(FirstName = 'Test', LastName = 'INVALIDNAME');

        // Use Test.startTest() and Test.stopTest() to simulate a transaction
        // and ensure asynchronous operations (if any) are processed.
        Test.startTest();

        // Expect a DML exception when inserting the contact
        Boolean caughtException = false;
        try {
            insert invalidContact;
        } catch (DmlException e) {
            caughtException = true;
            // Assert that the error message contains the expected text
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'),
                          'Expected DML exception with specific error message for invalid last name on insert.');
        }

        System.assert(caughtException, 'Expected DML exception but none was caught for invalid insert.');
        Test.stopTest();
    }

    /**
     * @description Tests the trigger's behavior when inserting a Contact with a valid last name.
     * Expected: The contact should be successfully inserted.
     */
    @isTest
    static void testInsertWithValidLastName() {
        // Create a contact with a valid last name
        Contact validContact = new Contact(FirstName = 'John', LastName = 'Doe');

        Test.startTest();
        // Insert the contact; no exception should be thrown
        Database.SaveResult sr = Database.insert(validContact, false); // Using Database.insert to check partial success if needed
                                                                       // but for a single record, `insert` works fine.
        Test.stopTest();

        // Assert that the insert was successful
        System.assert(sr.isSuccess(), 'Expected successful insert for valid contact');
        // System.assertNotNull(validContact.Id, 'Contact ID should not be null after successful insert');

        // Optionally, retrieve the contact to verify data
        Contact insertedContact = [SELECT Id, FirstName, LastName FROM Contact WHERE Id = :validContact.Id];
        System.assertEquals('John', insertedContact.FirstName, 'First Name should match');
        System.assertEquals('Doe', insertedContact.LastName, 'Last Name should match');
    }
    
}