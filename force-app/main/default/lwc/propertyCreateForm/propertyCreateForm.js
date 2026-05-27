// propertyCreateForm.js

import { LightningElement } from 'lwc';

import createProperty from '@salesforce/apex/PropertyCreationController.createProperty';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class PropertyCreateForm extends LightningElement {

    propertyName = '';
    address = '';
    city = '';
    state = '';
    postalCode = '';
    country = '';
    propertyType = '';
    furnishingStatus = '';
    availabilityStatus = '';
    rent;
    description = '';

    recordId;
    isPropertyCreated = false;
    uploadedFiles = 0;

    // OPTIONS

    typeOptions = [
        { label: 'Residential', value: 'Residential' },
        { label: 'Commercial', value: 'Commercial' }
    ];

    furnishingOptions = [
        { label: 'Furnished', value: 'Furnished' },
        { label: 'Semi-Furnished', value: 'Semi-Furnished' },
        { label: 'Unfurnished', value: 'Unfurnished' }
    ];

    statusOptions = [
        { label: 'Available', value: 'Available' },
        { label: 'Occupied', value: 'Occupied' }
    ];

    // HANDLERS

    handleUploadFinished(event) {
        const uploadedFiles = event.detail.files;

        console.log('Uploaded Files:', uploadedFiles);

        uploadedFiles.forEach(file => {
            console.log(file.name);
            console.log(file.documentId);
        });
    }

    handleName(event) {
        this.propertyName = event.target.value;
    }

    handleAddress(event) {
        this.address = event.target.value;
    }

    handleRent(event) {
        this.rent = event.target.value;
    }

    // CREATE PROPERTY

    async createProperty() {

        try {

            const result = await createProperty({

                propertyName: this.propertyName,
                address: this.address,
                city: this.city,
                stateValue: this.state,
                postalCode: this.postalCode,
                country: this.country,
                propertyType: this.propertyType,
                furnishingStatus: this.furnishingStatus,
                availabilityStatus: this.availabilityStatus,
                rent: this.rent,
                description: this.description

            });

            this.recordId = result;

            this.isPropertyCreated = true;

            this.showToast(
                'Success',
                'Property Created. Please Upload Images.',
                'success'
            );

        } catch(error) {

            console.log(error);

            this.showToast(
                'Error',
                error.body.message,
                'error'
            );
        }
    }

    // FILE UPLOAD

    handleUploadFinished(event) {

        this.uploadedFiles = event.detail.files.length;

        this.showToast(
            'Success',
            this.uploadedFiles + ' file(s) uploaded successfully',
            'success'
        );
    }

    // FINAL VALIDATION

    finishCreation() {

        if(this.uploadedFiles === 0) {

            this.showToast(
                'Error',
                'Please upload at least one image',
                'error'
            );

            return;
        }

        this.showToast(
            'Success',
            'Property Created Successfully',
            'success'
        );
    }

    // TOAST

    showToast(title, message, variant) {

        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}