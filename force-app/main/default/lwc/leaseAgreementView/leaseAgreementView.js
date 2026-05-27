import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LeaseAgreementView extends LightningElement {

    handleSubmit() {

        this.template
            .querySelector('lightning-record-edit-form')
            .submit();
    }

    handleSuccess() {

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Agreement Created Successfully',
                variant: 'success'
            })
        );
    }

    handleError(event) {

        console.log('Error:', event.detail);

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: event.detail.message,
                variant: 'error'
            })
        );
    }
}