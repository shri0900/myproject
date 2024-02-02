import { LightningElement,wire } from 'lwc';
import { MessageContext,subscribe } from 'lightning/messageService';
import COUNTING_UPDATE from '@salesforce/messageChannel/countingUpdate__c';
export default class SubComp extends LightningElement {

    count=0;
    subscription=null;
    @wire(MessageContext)
    messagecontext;

    connectedCallback(){
        this.subscribeToMessagechannel();
    }

    subscribeToMessagechannel(){
        this.subscription=subscribe(
            this.messagecontext,
            COUNTING_UPDATE,
            (message)=>this.handleMessage(message)
        );
    }

    handleMessage(message){
        if(message.operator=='add'){
            this.count=this.count*message.constant;
        }
        else if(message.operator=='substract'){
            this.count=this.count*message.constant;
        }
    }
    

}