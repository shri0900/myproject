import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement {

    handleAddition(){
        this.dispatchEvent(new CustomEvent('add'));
    }

    handleSub(){
        this.dispatchEvent(new CustomEvent('substract'))
    }

    handleMultiply(event){
        const multifactor=event.target.value;
        console.log("MultiFactor"+multifactor);
        this.dispatchEvent(new CustomEvent('multiply',{
            detail:multifactor
        }));
    }
}