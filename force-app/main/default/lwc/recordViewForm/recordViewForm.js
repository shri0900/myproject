import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class RecordViewForm extends LightningElement {
    objapiName=ACCOUNT_OBJECT;

    recId='001GA00004ra12HYAQ';

    nameField=NAME_FIELD;
    IndustryFieldField=INDUSTRY_FIELD;


}