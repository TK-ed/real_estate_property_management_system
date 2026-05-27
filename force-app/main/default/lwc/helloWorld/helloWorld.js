import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
        ready = false;
        greeting = 'World';
        changeHandler(e) {
        this.greeting = e.target.value;
        }

        connectedCallback() {
                setTimeout(() => {
                        this.ready = true;
                }, 3000);
        }

        handleClick() {
                this.greeting = 'Salesforce Developers';
                alert("changed");
        }
}