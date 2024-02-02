import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ShowToastEvent from 'lightning/platformShowToastEvent';


export default class RecEditForm extends LightningElement {
    objapiName=CONTACT_OBJECT;
    conLastName=NAME_FIELD;
    conEmail=EMAIL_FIELD;

    handleSuccess(event){
        const evt=new ShowToastEvent({
            title:'Congrats',
            message:'message',
            variant:'success'
        });
        this.dispatchEvent(evt);

    }

}