import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';


export default class NavigationComp extends NavigationMixin(LightningElement)  {
  
    handleNav(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Account',
                actionName:'home'
            }
        });
    }

    handleClick(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Account',
                actionName:'list'
            },
            state:{
                filterName:'Recent'
            }
    })
}

handleNavToRecord(){
    this[NavigationMixin.Navigate]({
        type:'standard__recordPage',
        attributes:{
            objectApiName:'Account',
            recordId:'001GA00004rZyx9YAC',
            actionName:'view'
        }
    });
}

    handleNavToWen() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: 'https://www.linkedin.com/uas/login?session_redirect=https%3A%2F%2Fwww.linkedin.com%2Ffeed%2F'
            }
        });
    }
    
}
