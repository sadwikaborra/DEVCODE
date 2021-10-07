import { LightningElement,api,track,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_Phone_FIELD from '@salesforce/schema/Account.Phone';
import ACCOUNT_Type_FIELD from '@salesforce/schema/Account.Type';
import ACCOUNT_Industry_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_AnnualRevenue_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import ACCOUNT_STREET_FIELD from '@salesforce/schema/Account.BillingStreet';
import ACCOUNT_CITY_FIELD from '@salesforce/schema/Account.BillingCity';
import ACCOUNT_POSTCODE_FIELD from '@salesforce/schema/Account.BillingState';
export default class lwc7 extends LightningElement {
    @api recordId;
    @track record;
    @track error;
    @wire(getRecord, { recordId: '$recordId', fields: [ACCOUNT_NAME_FIELD,ACCOUNT_Phone_FIELD,ACCOUNT_Type_FIELD,ACCOUNT_Industry_FIELD,ACCOUNT_AnnualRevenue_FIELD,ACCOUNT_STREET_FIELD,
        ACCOUNT_CITY_FIELD, ACCOUNT_POSTCODE_FIELD] })
    wiredAccount({ error, data }) {
        if (data) {
            this.record = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }
    get name() {
        //return getFieldValue(this.record.data, ACCOUNT_NAME_FIELD);
        return this.record.fields.Name.value;
    }
    get Phone() {
        return this.record.fields.Phone.value;
    }
    get Type() {
        return this.record.fields.Type.value;
    }
    get Industry() {
        return this.record.fields.Industry.value;
    }
    get AnnualRevenue() {
        return this.record.fields.AnnualRevenue.value;
    }
    get BillingAddress() {
        return this.record.fields.BillingAddress.value;
    }
}