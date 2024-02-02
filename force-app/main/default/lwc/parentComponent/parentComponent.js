import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    counter=0;

    handleNumChange(event){
        this.counter=event.target.value;
    }

    handleAdditionEvent(){
        this.template.querySelector('c-child-component').handleAdditions();
    }

    handleSubsctrationsEvent(){
        this.template.querySelector('c-child-component').handleSubstractions();
    }
}