public class AccountTriggerHelper {
    
    //Upon Account Creation if industry is media or energy populate rating as hot
    /*public static void updateRating(List<Account>newAccList){
        For(Account acc:newAccList){
            if(acc.Industry=='Media'||acc.Industry=='Energy'){
                acc.rating='Hot';
            }
        }
    }*/
    
    //When a account record is created if copy billing address to shipping address checkbox is checked then copy billing to shipping
    public static void copyBillingAddressToShippingAddress(List<Account>newAccList,Map<Id,Account>oldAccMap){
        For(Account acc:newAccList){
            if((acc.Copy_Billing_Address_to_Shipping_Address__c==True && oldAccMap==null&& acc.Copy_Billing_Address_to_Shipping_Address__c!=null) || ((oldAccMap.get(acc.Id).Copy_Billing_Address_to_Shipping_Address__c!=acc.Copy_Billing_Address_to_Shipping_Address__c)&&(acc.Copy_Billing_Address_to_Shipping_Address__c==true))){
                acc.ShippingCountry=acc.BillingCountry;
                acc.ShippingState=acc.BillingState;
                acc.ShippingCity=acc.BillingCity;
                acc.ShippingPostalCode=acc.BillingPostalCode;
            }
        }
    }
    //When a account record is created create a related opportunity
    public static void createOpps(List<Account>accList){
        List<Opportunity>newOpps=New List<Opportunity>();
        For(Account acc:accList){
            Opportunity opp=New Opportunity();
            opp.name=acc.Name+' Trigger';
            opp.AccountId=acc.Id;
            opp.StageName='Prospecting';
            opp.CloseDate=system.today()+10;
            newOpps.add(opp);            
        }
        
        if(!newOpps.IsEmpty()){
            insert newOpps;
        }  
    }
    //When a account phone is updated update same in description
    public static void updateAccDesc(List<Account>newAccList,Map<Id,Account>oldAccMap){
        
        For(Account acc:newAccList){
            if(acc.phone!=null && acc.phone != oldAccMap.get(acc.Id).Phone){
                acc.Description='Phone Number Updated Old Value'+oldAccMap.get(acc.Id).Phone+' New Value '+acc.phone;
            }
        }
    }
    
    //Requirement-Upon Account Creation or Updation if industry is media populate rating as hot
    public static void updateRating(List<Account>newAccList,Map<Id,Account>oldAccMap){
        for(Account acc:newAccList){
            if(Acc.Industry=='Media' && acc.Industry!=oldAccMap.get(acc.id).Industry){
                acc.Rating='Hot';
            }
        }
    }
    //Requirement-When Account phone is updated update it on related contacts
    public static void updateRelConPhone(List<Account>newAccList,Map<Id,Account>oldAccMap){
        Set<Id>accIds=New Set<Id>();
        For(Account acc:newAccList){
            if(acc.phone!=null && acc.phone!=oldAccMap.get(acc.Id).Phone){
                accIds.add(acc.id);
            }
        }
        
        Map<Id,Account> accMap=New Map<Id,Account>();
        For(Account acc:[SELECT Id,Phone FROM Account WHERE ID IN:accIDs]){
            accMap.put(acc.id,acc);
        }
        List<contact>updatedConList=NEw List<Contact>();
        For(Contact con:[SELECT Id,AccountId,Phone FROM Contact WHERE AccountId IN:accIDs]){
          if(accMap.containsKey(con.accountId)){
                con.phone=accMap.get(con.accountId).Phone;
            }
            updatedConList.add(con);
        }
        if(!updatedConList.IsEmpty()){
            update updatedConList;
        }
    }
    //Requirement-when Accounts active field is changes from yes to no then closed lost all the related opportunities
    public static void updateRelatedOpps(List<Account>newAccList,Map<Id,Account>oldAccMap){
        Set<Id>accIds=New Set<Id>();
        for(Account acc:newAccList){
            if(acc.Active__c=='No' && oldAccMap.get(Acc.Id).Active__c!='No'){
                accIds.add(acc.id);
            }
        }
        
        Map<id,Account>AccMap=New Map<Id,Account>();
        for(Account acc:[SELECT Id,active__c FROM Account wHERE ID IN:accIds]){
            accMap.put(acc.id,acc);
        }
        List<Opportunity>oppToUpdate=New List<Opportunity>();
        For(Opportunity opp:[SELECT Id,StageName,accountId FROM Opportunity WHERE AccountId IN:accIDs]){
            if(accmap.containskey(opp.AccountId)&&accmap.get(opp.AccountId).Active__C=='No'){
                opp.StageName='Cloased Lost';
                oppToUpdate.add(opp);
            }
        }
        
        if(!oppToUpdate.ISEmpty()){
            update oppToUpdate;
        }
    }
    
    //Requirement-Prevent deletion of record is active__C='Yes'
    public static void preventdeletion(List<Account>oldAccList){
        For(Account acc:oldAccList){
            if(acc.Active__c=='Yes'){
                acc.adderror('Can not delete Active Accounts:Please Contact Admin');
            }
        }
    }
    
    //Requirement-When account record is created create a related contact as well
    public static void createCon(List<Account>accList){
        List<Contact>conList=New List<Contact>();
        
        For(Account acc:accList){
            Contact con=New Contact();
            con.lastName='Trigger '+acc.Name;
            con.AccountId=acc.id;
            conList.add(con);
        }
        
        if(!conList.IsEmpty()){
            insert conList;
        }
    }
    //Requirement-When a account phone field is updated update its related contacts phone field
    public static void populateRelConPhone(List<Account>newAccList,Map<Id,Account>OldAccMap){
       Set<Id>accIds=New Set<Id>();
        For(Account acc:newAccList){
            if((oldAccMap==null && acc.phone!=null)||(acc.phone!=null&acc.phone!=oldAccMap.get(acc.Id).Phone)){
                accIds.add(acc.id);
            }
        }
        Map<Id,Account>accMap=New Map<Id,Account>();
        
        For(Account acC:[SELECT Id,Name,Phone FROM Account WHERE ID IN:accIDs]){
            accMap.put(acc.Id,acc);
        }
        List<contact>conToUpdate=New List<Contact>();
        For(Contact con:[SELECT Id,HomePhone,AccountId FROM Contact WHERE AccountId IN:accIDs]){
            if(accMap.containsKey(con.accountId)){
                con.HomePhone=accMap.get(con.AccountId).Phone;
                conToUpdate.add(con);
            }
        }
        if(!conToUpdate.IsEmpty()){
            update conToUpdate;
        }
        
    }
    //Prevent edition  of record if active is yes
    public static void preventEditable(List<Account>accList){
        for(Account acc:accList){
            if(acc.CreatedDate<System.today()-7){
                acc.addError('Can not Edit accounts older than 7 days');
            }
        }
    }
}