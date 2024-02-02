import { LightningElement } from 'lwc';
import createAccount from '@salesforce/apex/AccountHelper.createAccount';

export default class CreateRecordUsingApex extends LightningElement {
   accName;
   accId;
   accIndustry;
  
   handleNameChange(event){
        this.accName=event.target.value;
    }

    handleIndustryChange(event){
        this.accIndustry=event.target.value;
    }

    handleCreate(){
        createAccount({accountName:this.accName,accIndustry:this.accIndustry})
        .then(result=>{
            console.log("Result"+JSON.stringify(result));
            this.accId=result[0].Id;
        })
        .catch(error=>{
            console.log("error"+JSON.stringify(error))
        })
    }
}