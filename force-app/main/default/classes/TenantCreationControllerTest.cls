/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : TenantCreationControllerTest
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
public class TenantCreationControllerTest {

    @isTest
    static void testCreateTenant() {

        // Call Apex method
        Test.startTest();

        Id tenantId = TenantCreationController.createTenant(
            'John Doe',
            '9876543210',
            'john@example.com'
        );

        Test.stopTest();

        // Validate record was created
        Tenant__c createdTenant = [
            SELECT Id, Name, Phone__c, Email__c
            FROM Tenant__c
            WHERE Id = :tenantId
        ];

        System.assertNotEquals(null, createdTenant, 'Tenant should be created');

        System.assertEquals('John Doe', createdTenant.Name);
        System.assertEquals('9876543210', createdTenant.Phone__c);
        System.assertEquals('john@example.com', createdTenant.Email__c);
    }
}