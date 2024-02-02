import { LightningElement,wire } from 'lwc';
import { MessageContext,publish } from 'lightning/messageService';
import COUNTING_UPDATE from '@salesforce/messageChannel/countingUpdate__c';

export default class Pubcomp extends LightningElement {
    @wire(MessageContext)
    messagecontext

    handleAdditions(){
        const payload={
            operator:'add',
            constant:2
        };

        publish(this.messagecontext,COUNTING_UPDATE,payload);
    }

    handleSubstarctions(){
        const payload={
            operator:'substract',
            constant:2
        };
        publish(this.messagecontext,COUNTING_UPDATE,payload);
    }


}