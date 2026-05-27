import { LightningElement, track } from 'lwc';

import getProperties from '@salesforce/apex/propertyController.getProperties';

export default class PropertyListView extends LightningElement {

    @track properties = [];

    pageSize = 25;
    pageNumber = 1;

    availabilityStatus = '';
    furnishingStatus = '';
    minPrice;
    maxPrice;

    disablePrevious = true;
    disableNext = false;

    columns = [

        { label: 'Property Name', fieldName: 'Name' },

        { label: 'City', fieldName: 'City__c' },

        { label: 'Type', fieldName: 'Type__c' },

        { label: 'Rent', fieldName: 'Rent__c', type: 'currency' },

        { label: 'Status', fieldName: 'Status__c' },

        { label: 'Furnishing', fieldName: 'Furnishing_Status__c' }

    ];

    statusOptions = [
        { label: 'Available', value: 'Available' },
        { label: 'Occupied', value: 'Occupied' }
    ];

    furnishingOptions = [
        { label: 'Furnished', value: 'Furnished' },
        { label: 'Semi-Furnished', value: 'Semi-Furnished' },
        { label: 'Unfurnished', value: 'Unfurnished' }
    ];

    connectedCallback() {

        this.loadProperties();
    }

    async loadProperties() {

        try {

            const result = await getProperties({

                pageSize: this.pageSize,
                pageNumber: this.pageNumber,
                availabilityStatus: this.availabilityStatus,
                furnishingStatus: this.furnishingStatus,
                minPrice: this.minPrice,
                maxPrice: this.maxPrice

            });

            this.properties = result;

            this.disablePrevious = this.pageNumber === 1;

            this.disableNext = result.length < this.pageSize;

        } catch(error) {

            console.log(error);
        }
    }

    // FILTERS

    handleStatusChange(event) {

        this.availabilityStatus = event.target.value;
    }

    handleFurnishingChange(event) {

        this.furnishingStatus = event.target.value;
    }

    handleMinPrice(event) {

        this.minPrice = event.target.value;
    }

    handleMaxPrice(event) {

        this.maxPrice = event.target.value;
    }

    // PAGINATION

    nextPage() {

        this.pageNumber++;

        this.loadProperties();
    }

    previousPage() {

        if(this.pageNumber > 1) {

            this.pageNumber--;

            this.loadProperties();
        }
    }
}