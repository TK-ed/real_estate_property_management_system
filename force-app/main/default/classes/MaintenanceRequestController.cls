public with sharing class MaintenanceRequestController {

    public static void assignVendor(
        List<Maintenance_Request__c> newReqs
    ) {

        // Workload map
        Map<Id, Integer> workload =
            new Map<Id, Integer>();

        for (AggregateResult ar : [

            SELECT Vendor__c vId,
                   COUNT(Id) cnt

            FROM Maintenance_Request__c

            WHERE Vendor__c != NULL

            GROUP BY Vendor__c

        ]) {

            workload.put(

                (Id) ar.get('vId'),

                Integer.valueOf(
                    ar.get('cnt')
                )
            );
        }

        // Get all vendors
        List<Vendor__c> vendors = [

            SELECT Id, Name
            FROM Vendor__c
        ];

        // Find least loaded vendor
        Id selectedVendor;

        Integer minLoad = 999999;

        for (Vendor__c v : vendors) {

            Integer load =
                workload.containsKey(v.Id)

                ? workload.get(v.Id)

                : 0;

            if (load < minLoad) {

                minLoad = load;

                selectedVendor = v.Id;
            }
        }

        // Assign vendor
        for (Maintenance_Request__c mr : newReqs) {

            mr.Vendor__c = selectedVendor;
        }
    }
}