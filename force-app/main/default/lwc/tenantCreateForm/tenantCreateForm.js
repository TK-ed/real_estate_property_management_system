import { LightningElement } from 'lwc';
import createTenant from '@salesforce/apex/TenantCreationController.createTenant';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class TenantCreateForm extends LightningElement {

    tenantName = '';
    phone = '';
    email = '';

    recordId;
    isTenantCreated = false;

    handleName(event) {
        this.tenantName = event.target.value;
    }

    handlePhone(event) {
        this.phone = event.target.value;
    }

    handleEmail(event) {
        this.email = event.target.value;
    }

    async createTenant() {

        try {

            const result = await createTenant({
                tenantName: this.tenantName,
                phone: this.phone,
                email: this.email
            });

            this.recordId = result;
            this.isTenantCreated = true;

            this.showToast(
                'Success',
                'Tenant Created Successfully.',
                'success'
            );

        } catch (error) {

            console.error(error);

            this.showToast(
                'Error',
                error.body?.message || error.message,
                'error'
            );
        }
    }

    showToast(title, message, variant) {

        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}