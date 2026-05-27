/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : TenantCreationController
 * Author          : <YourName>
 * Created Date    : May 26, 2026
 * Last Modified By: Tharun
 * Last Modified On: May 26, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  May 26, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class TenantCreationController {

	@AuraEnabled
    public static Id createTenant(
        String tenantName,
        String phone,
        String email
    ) {

        Tenant__c tenant = new Tenant__c();

        tenant.Name = tenantName;
        tenant.Phone__c = phone;
        tenant.Email__c = email;

        insert tenant;

        return tenant.Id;
    }

}