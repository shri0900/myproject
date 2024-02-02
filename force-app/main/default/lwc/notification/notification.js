import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class Notification extends LightningElement {
    handleNotification(){
        const evt=new ShowToastEvent({
            title:'Congratulations',
            variant:'warning',
            message:'Notification Shown Successfully'
        });

        this.dispatchEvent(evt);
    }
}