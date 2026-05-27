/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : PropertyCreationControllerTest
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
public class PropertyCreationControllerTest {

    @isTest
    static void testCreateProperty() {

        Test.startTest();

        Id propertyId = PropertyCreationController.createProperty(
            'Test Property',
            'MG Road, Chennai',
            25000
        );

        Test.stopTest();

        // Query inserted record
        Property_Mgmt__c prop = [
            SELECT Id,
                   Name,
                   Rent__c,
                   Status__c,
                   Address__c,
                   Furnishing_Status__c,
                   City__c,
                   State__c,
                   Country__c,
                   Type__c,
                   Description__c
            FROM Property_Mgmt__c
            WHERE Id = :propertyId
        ];

        // Assertions
        System.assertNotEquals(null, prop, 'Property should be created');

        System.assertEquals('Test Property', prop.Name);
        System.assertEquals(25000, prop.Rent__c);
        System.assertEquals('Available', prop.Status__c);
        System.assertEquals('MG Road, Chennai', prop.Address__c);
        System.assertEquals('Unfurnished', prop.Furnishing_Status__c);
        System.assertEquals('New Delhi', prop.City__c);
        System.assertEquals('TN', prop.State__c);
        System.assertEquals('India', prop.Country__c);
        System.assertEquals('Commercial', prop.Type__c);
        System.assertEquals('Newly added property', prop.Description__c);
    }
}