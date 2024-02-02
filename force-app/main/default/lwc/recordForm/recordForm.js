import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FILED from '@salesforce/schema/Contact.Email';
export default class RecordForm extends LightningElement {
    objApiName=CONTACT_OBJECT;
    
    fields=[NAME_FIELD,EMAIL_FILED];
}