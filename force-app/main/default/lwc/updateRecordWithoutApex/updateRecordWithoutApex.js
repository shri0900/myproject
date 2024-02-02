import { LightningElement } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import ID_FIELD from '@salesforce/schema/Account.Id';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import Industry_FIELD from '@salesforce/schema/Account.Industry';

export default class UpdateRecordWithoutApex extends LightningElement {

    accId;
    accName;
    accIndustry;

    handleIdChange(event){
        this.accId=event.target.value;
    }

    handleNameChange(event){
        this.accName=event.target.value;
    }

    handleIndustryChange(event){
        this.accIndustry=event.target.value;
    }

    handleClick(){
        const fields={};
        fields[ID_FIELD.fieldApiName]=this.accId;
        fields[NAME_FIELD.fieldApiName]=this.accName;
        fields[Industry_FIELD.fieldApiName]=this.accIndustry;

        const recordInput={fields};

        updateRecord(recordInput)
        .then(result=>{
            console.log("Result for update received"+JSON.stringify(result))
            window.alert(result[o].Name);
        })
        .catch(error=>{
            console.log("Error"+JSON.stringify(error))
        })
    }

}