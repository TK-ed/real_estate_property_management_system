@isTest
public class PropertyControllerTest {

    @isTest
    static void testGetProperties() {

        List<Property_Mgmt__c> properties =
            new List<Property_Mgmt__c>();

        for(Integer i = 1; i <= 5; i++) {

            String furnishingStatus;
            String availabilityStatus;

            if(Math.mod(i, 2) == 0) {

                furnishingStatus = 'Furnished';

                availabilityStatus = 'Available';

            } else {

                furnishingStatus = 'Unfurnished';

                availabilityStatus = 'Occupied';
            }

            properties.add(

                new Property_Mgmt__c(

                    Name = 'Property ' + i,

                    Address__c = 'Street ' + i,

                    City__c = 'Chennai',

                    State__c = 'Tamil Nadu',

                    Postal_Code__c = 600001,

                    Country__c = 'India',

                    Type__c = 'Residential',

                    Furnishing_Status__c =
                        furnishingStatus,

                    Status__c =
                        availabilityStatus,

                    Rent__c = 10000 * i,

                    Description__c =
                        'Test Property Description'
                )
            );
        }

        insert properties;

        Test.startTest();

        List<Property_Mgmt__c> result =

            propertyController.getProperties(

                2,
                1,
                'Available',
                'Furnished',
                10000,
                50000
            );

        Test.stopTest();

        System.assertNotEquals(
            null,
            result
        );

        System.assert(
            result.size() > 0,
            'Properties should be returned'
        );

        for(Property_Mgmt__c prop : result) {

            System.assertEquals(
                'Available',
                prop.Status__c
            );

            System.assertEquals(
                'Furnished',
                prop.Furnishing_Status__c
            );
        }
    }
}