trigger MaintenanceRequestTrigger on Maintenance_Request__c (before insert) {
    if (!Trigger.new.isEmpty()) {
        MaintenanceRequestController.assignVendor(Trigger.new);
    }
}