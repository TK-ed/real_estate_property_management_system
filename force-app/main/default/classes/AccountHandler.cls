public with sharing  class AccountHandler {
    public static Account insertNewAccount(String str) {
        try {
            if (String.isEmpty(str)) {
                throw new DmlException('Account name cannot be empty.');
            }

            Account a = new Account(Name = str);
            Database.insert(a);
            System.debug(a);
            return a; // Return the entire Account object
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            return null; // Return null in case of an exception
        }
    }
}