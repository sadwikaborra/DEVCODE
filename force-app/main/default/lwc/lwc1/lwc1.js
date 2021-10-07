import { LightningElement } from 'lwc';

export default class Lwc1 extends LightningElement {
    greeting = "World";
    changeHandler(event) {
        this.greeting = event.target.value;
}
}