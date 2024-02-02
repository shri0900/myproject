import { LightningElement, api } from 'lwc';

export default class ChildComponent extends LightningElement {

    @api
    startvalue;

    @api
    handleAdditions(){
        this.startvalue++;
    }

    @api
    handleSubstractions(){
        this.startvalue--;
    }
}