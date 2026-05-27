@isTest(SeeAllData=False)
public class MaintenanceRequestControllerTest {

    @isTest
    static void testAssignVendor() {

        // Create Vendors
        Vendor__c vendor1 = new Vendor__c(
            Name = 'Vendor One'
        );

        Vendor__c vendor2 = new Vendor__c(
            Name = 'Vendor Two'
        );

        insert new List<Vendor__c>{
            vendor1,
            vendor2
        };

        // Create Property
        Property_Mgmt__c property = new Property_Mgmt__c(

            Name = 'Test Property',

            Address__c = 'Street 1',

            City__c = 'Chennai',

            State__c = 'Tamil Nadu',

            Postal_Code__c = 600001,

            Country__c = 'India',

            Type__c = 'Residential',

            Status__c = 'Available',

            Rent__c = 25000,

            Description__c = 'Test Description'
        );

        insert property;

        // Existing request assigned to vendor1 to create workload imbalance

        Maintenance_Request__c existingReq =
            new Maintenance_Request__c(

                Property__c = property.Id,

                Vendor__c = vendor1.Id,

                Status__c = 'Open'
            );

        insert existingReq;

        // New request to test assignment

        Maintenance_Request__c newReq =
            new Maintenance_Request__c(

                Property__c = property.Id,

                Status__c = 'Open'
            );

        Test.startTest();

        insert newReq;

        Test.stopTest();

        // Fetch inserted request
        Maintenance_Request__c insertedReq = [
            SELECT Id, Vendor__c FROM Maintenance_Request__c WHERE Id = :newReq.Id
        ];

        // Vendor2 should be assigned
        // because vendor1 already had workload

        System.assertEquals(

            vendor2.Id,

            insertedReq.Vendor__c,

            'Least loaded vendor should be assigned'
        );
    }
}