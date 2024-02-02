import { LightningElement,track,wire } from 'lwc';
import getAccs from '@salesforce/apex/AccountHelper.getAccs';

const columns=[
    {label:'Account Name',fieldName:'Name'},
    {label:'Account Id',fieldName:'Id'}
];
export default class LiDataTable extends LightningElement {

  @track data=[];
   columns=columns;

   @wire(getAccs)
   wiredAccs({data,error}){
    if(data){
        this.data=data;
    }else if(error){
        console.log("Error"+JSON.stringify(error));
    }
   }
}