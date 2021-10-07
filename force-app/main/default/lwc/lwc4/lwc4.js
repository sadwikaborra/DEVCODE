import { LightningElement,  api, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class Testt extends LightningElement {
    @api recordId;
    @track contactRecord = {};

    handleFieldChange(e) {
        this.contactRecord[e.currentTarget.fieldName] = e.target.value;
    }
    saveForm() {
       this.contactRecord.AccountId=this.recordId;

        createRecord({ apiName: CONTACT_OBJECT.objectApiName, fields: this.contactRecord })
        .then(contact => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contact created from saveForm => ' + contact.id,
                    variant: 'success'
                })
            );
        })
        .catch((error) => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        });
       
    }   
}