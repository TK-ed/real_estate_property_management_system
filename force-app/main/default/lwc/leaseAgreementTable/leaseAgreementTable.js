import { LightningElement, track } from 'lwc';
import getAgreements from '@salesforce/apex/LeaseAgreementController.getAgreements';

export default class LeaseAgreementTable extends LightningElement {

    @track agreements = [];

    columns = [

        {
            label: 'Agreement',
            fieldName: 'Name'
        },

        {
            label: 'Rent',
            fieldName: 'Agreed_Monthly_Rent__c',
            type: 'currency'
        },

        {
            label: 'Start Date',
            fieldName: 'Start_Date__c',
            type: 'date'
        },

        {
            label: 'End Date',
            fieldName: 'End_Date__c',
            type: 'date'
        }
    ];

    connectedCallback() {

        this.loadAgreements();
    }

    async loadAgreements() {

        try {
            const result = await getAgreements();
            this.agreements = [...result];
            
        } catch(error) {

            console.log(error);
        }
    }

}