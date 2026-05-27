public with sharing class LeaseAgreementController {

    @AuraEnabled(cacheable=true)
    public static List<Lease_Agreement__c> getAgreements() {

        return [

            SELECT Id,
                   Name,
                   Terms__c,
                   Agreed_Monthly_Rent__c,
                   Start_Date__c,
                   End_Date__c,
                   Property_Mgmt__r.Name,
                   Tenant__r.Name

            FROM Lease_Agreement__c
        ];
    }

    @AuraEnabled
    public static void createAgreement(

        Lease_Agreement__c agreement

    ) {

        insert agreement;
    }
}