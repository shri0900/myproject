import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class CreateRecordWithoutApex extends LightningElement {

    accName;
    accIndustry;
    accRating;

    handleNamechange(event){
        this.accName=event.target.value;
    }

    handleIndustrychange(event){
        this.accIndustry=event.target.value;
    }

    handleRatingchange(event){
        this.accRating=event.target.value;
    }

    handleAcc(){

       const fields={};
        fields[NAME_FIELD.fieldApiName]=this.accName;
        fields[RATING_FIELD.fieldApiName]=this.accRating;
        fields[INDUSTRY_FIELD.fieldApiName]=this.accIndustry;

        const recordInput={apiName:ACCOUNT_OBJECT.objectApiName,fields};

       createRecord(recordInput)
       .then(result=>{
        console.log("Result"+JSON.stringify(result));
        window.alert('Account Created'+result[0].id);
       })
       .catch(error=>{
        console.log("error"+JSON.stringify(error))
       })
    }
}