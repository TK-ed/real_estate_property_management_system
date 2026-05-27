public with sharing class propertyController {

    @AuraEnabled(cacheable=true)
    public static List<Property_Mgmt__c> getProperties(

        Integer pageSize,
        Integer pageNumber,
        String availabilityStatus,
        String furnishingStatus,
        Decimal minPrice,
        Decimal maxPrice

    ) {

        Integer offsetValue = (pageNumber - 1) * pageSize;

        String query = 'SELECT Id, Name, Rent__c, Status__c, ' +
                       'Furnishing_Status__c, Type__c, City__c ' +
                       'FROM Property_Mgmt__c WHERE Id != null';

        // FILTERS

        if(availabilityStatus != null && availabilityStatus != '') {

            query += ' AND Status__c = :availabilityStatus';
        }

        if(furnishingStatus != null && furnishingStatus != '') {

            query += ' AND Furnishing_Status__c = :furnishingStatus';
        }

        if(minPrice != null) {

            query += ' AND Rent__c >= :minPrice';
        }

        if(maxPrice != null) {

            query += ' AND Rent__c <= :maxPrice';
        }

        // PAGINATION

        query += ' LIMIT :pageSize OFFSET :offsetValue';

        return Database.query(query);
    }
}