import { LightningElement } from 'lwc';
import updateAcc from '@salesforce/apex/AccountHelper.updateAcc';

export default class UpdateRecordUsingApex extends LightningElement {
accId;
accName;

handleIdChange(event){
    this.accId=event.target.value;
}

handleNameChange(event){
    this.accName=event.target.value;
}

handleUpdate(){
    updateAcc({accountId:this.accId,accountName:this.accName})
    .then(result=>{
        console.log("Result"+JSON.stringify(result))
    })
    .catch(error=>{
        console.log("Error"+JSON.stringify(error))
    })
}
}