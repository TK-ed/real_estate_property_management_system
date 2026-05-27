public with sharing class PropertyCreationController {

    @AuraEnabled
    public static Id createProperty(
        String propertyName,
        String address,
        Decimal rent
    ) {

        Property_Mgmt__c property = new Property_Mgmt__c();

        property.Name = propertyName;
        property.Rent__c = rent;
        property.Status__c = 'Available';
        property.Address__c = address;
        property.Furnishing_Status__c = 'Unfurnished';
        property.City__c = 'New Delhi';
        // property.Postal_Code__c = 110001;
        property.State__c = 'TN';
        property.Description__c = 'Newly added property';
        property.Country__c = 'India';
        property.Type__c = 'Commercial';

        insert property;

        return property.Id;
    }
}