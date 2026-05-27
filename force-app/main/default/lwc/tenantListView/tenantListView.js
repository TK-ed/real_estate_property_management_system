import { LightningElement, track } from 'lwc';

import getTenants from '@salesforce/apex/TenantController.getTenants';

export default class TenantListView extends LightningElement {

    @track tenants = [];

    columns = [

        {
            label: 'Name',
            fieldName: 'Name'
        },

        {
            label: 'Phone',
            fieldName: 'Phone__c'
        },

        {
            label: 'Email',
            fieldName: 'Email__c'
        }
    ];

    connectedCallback() {

        this.loadTenants();
    }

    async loadTenants() {

        try {

            // this.tenants = await getTenants();
            const result = await getTenants();
            this.tenants = [...result];

        } catch(error) {

            console.log(error);
        }
    }
}