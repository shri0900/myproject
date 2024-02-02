import { LightningElement, track } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class LightningRecordEditForm extends LightningElement {

   @track objectApiName=ACCOUNT_OBJECT;
    //fields=[NAME_FIELD,INDUSTRY_FIELD];
  @track  nameField=NAME_FIELD;
  @track  industryField=INDUSTRY_FIELD;
    handleSuccess(){
        const evt=new ShowToastEvent({
            variant:'success',
            message:'Congrats',
            title:'New Account Created'
        });
        this.dispatchEvent(evt);
    }

}