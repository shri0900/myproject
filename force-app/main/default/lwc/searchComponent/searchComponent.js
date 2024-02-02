import { LightningElement } from 'lwc';
import getAccs from '@salesforce/apex/AccountHelper.getAccs';

export default class SearchComponent extends LightningElement {

value;
arrOptions=[];

get options(){
    return this.arrOptions;
}

connectedCallback(){
getAccs()
.then(result=>{
    let arr=[];
    for(var i=0;i<result.length;i++){
        arr.push({label:result[i].Name,value:result[i].Id});
    }

    this.arrOptions=arr;
})  
}


handleChange(event){
this.value=event.target.value;
}
}