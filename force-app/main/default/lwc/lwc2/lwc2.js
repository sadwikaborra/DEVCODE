import { LightningElement } from 'lwc';

export default class Lwc2 extends LightningElement {
    options = [
        {value:'Red', label:'Red'},
        {value: 'Green', label:'Green'},
        {value: 'Blue', label:'Blue'},
        {value: 'Yellow', label:'Yellow'},
        {value: 'Black', label:'Black'}
    ];
    value = 'Red';
    handleChange(event) {
        this.value = event.target.value;
    }
}