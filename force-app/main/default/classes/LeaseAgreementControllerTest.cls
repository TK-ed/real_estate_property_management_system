/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : LeaseAgreementControllerTest
 * Author          : <YourName>
 * Created Date    : May 26, 2026
 * Last Modified By: <YourName>
 * Last Modified On: May 26, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  May 26, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

@isTest
public class LeaseAgreementControllerTest {

    @isTest
    static void testCreateAndGetAgreements() {

        // Create test data (adjust required fields if your org has more)
        Property_Mgmt__c property = new Property_Mgmt__c(
            Name = 'Test Property',
            Type__c = 'Commercial',
            Status__c = 'Available',
            Rent__c = 18500
        );
        insert property;

        Tenant__c tenant = new Tenant__c(
            Name = 'Test Tenant',
            Phone__c = '9999999999',
            Email__c = 'test@test.com'
        );
        insert tenant;

        Lease_Agreement__c agreement = new Lease_Agreement__c(
            Name = 'Lease 1',
            Property_Mgmt__c = property.Id,
            Tenant__c = tenant.Id,
            Agreed_Monthly_Rent__c = 15000,
            Start_Date__c = Date.today(),
            End_Date__c = Date.today().addMonths(12),
            Terms__c = 'Test terms'
        );

        Test.startTest();

        // Call insert method
        LeaseAgreementController.createAgreement(agreement);

        // Call get method
        List<Lease_Agreement__c> result =
            LeaseAgreementController.getAgreements();

        Test.stopTest();

        // Assertions
        System.assertEquals(1, result.size(), 'One agreement should exist');

        Lease_Agreement__c fetched = result[0];

        System.assertEquals('Lease 1', fetched.Name);
        System.assertEquals(15000, fetched.Agreed_Monthly_Rent__c);
        System.assertNotEquals(null, fetched.Property_Mgmt__r);
        System.assertNotEquals(null, fetched.Tenant__r);
    }
}