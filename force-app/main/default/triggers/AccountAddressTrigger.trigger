trigger AccountAddressTrigger on Account (before update, before insert) {
    for (Account acc : Trigger.new) {
        if (acc.Match_Billing_Address__c == True) {
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
}