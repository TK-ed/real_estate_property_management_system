import { LightningElement } from 'lwc';

export default class Counter extends LightningElement {
    handleClick() {
        alert("clicked");
        console.log("clicked too!!")
    }
}