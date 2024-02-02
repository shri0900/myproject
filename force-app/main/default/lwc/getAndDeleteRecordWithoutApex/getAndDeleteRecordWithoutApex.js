import { LightningElement, wire } from 'lwc';
import { getRecord,deleteRecord } from 'lightning/uiRecordApi';
import ID_FIELd from '@salesforce/schema/Account.Id';
import NAME_FIELd from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELd from '@salesforce/schema/Account.Industry';
const FIELDS=[ID_FIELd,NAME_FIELd,INDUSTRY_FIELd];
export default class GetAndDeleteRecordWithoutApex extends LightningElement {
    accId;
    accName;
    accIndustry;
    accData;

    @wire(getRecord,{recordId:'001GA00004rZyx9YAC',fields:FIELDS})
    wiredAccs({data,error}){
        if(data){
            console.log("Data "+JSON.stringify(data))
            this.accData=data;
            this.accId=this.accData.id;
            this.accName=this.accData.fields.Name.value;
            this.accIndustry=this.accData.fields.Industry.value;
        }
        else if(error){
            console.log("error in getting data"+JSON.stringify(data));
        }
    }

    handleDelete(){
        deleteRecord(this.accId)
        .then(result=>{
            window.alert("Deleted")
        })
    }

}