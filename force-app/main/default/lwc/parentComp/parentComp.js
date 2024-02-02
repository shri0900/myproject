import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {
    startCounter=0;

    handleAdditions(){
        this.startCounter++;
    }

    handleSubstraction(){
        this.startCounter--;
    }

    handleMultiplication(event){
        const multiConstant=event.detail;

        console.log("multiconstant"+multiConstant);
        this.startCounter=this.startCounter*multiConstant;
    }

}