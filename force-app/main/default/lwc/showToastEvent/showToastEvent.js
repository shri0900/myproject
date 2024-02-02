import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ShowToastEvent extends LightningElement {

    handleNotification(){
        const evt=new ShowToastEvent({
            title:'Congratulations',
            variant:'success',
            message:'Notification Shown Successfully'
        });

        this.dispatchEvent(evt);
    }
}