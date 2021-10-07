import { LightningElement } from 'lwc';

export default class Lwc6 extends LightningElement {

    value = ['Checkbox is checked'];

    get options() {
        return [
            { label: 'true', value: 'Checkbox is checked' },
            { label: 'false', value: 'Checkbox is not checked' },
        ];
    }

    get selectedValues() {
        return this.value.join(',');
    }

    handleChange(e) {
        this.value = e.detail.value;
    }
}