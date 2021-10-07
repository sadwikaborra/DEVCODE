import { LightningElement, wire } from 'lwc';
import searchContacts from '@salesforce/apex/lwc88.searchContacts';

/** The delay used when debouncing event handlers before invoking Apex. */
const DELAY = 300;

export default class ApexWireMethodWithParams extends LightningElement {
    searchKey = '';

    @wire(searchContacts,{ searchKey: '$searchKey' })
    contacts;

    handleKeyChange(event) {
        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, DELAY);
    }
}