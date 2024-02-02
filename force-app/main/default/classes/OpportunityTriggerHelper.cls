public class OpportunityTriggerHelper {
    
    //Requirement-When a new Opportunity is created populate latest opportunity amount on account page
    public static void populateAmountOnAcc(List<Opportunity>newOppList){
        Set<Id>accIDs=New Set<Id>();
        
        For(Opportunity opp:newOppList){
            if(opp.accountId!=null){
                accIds.add(opp.AccountId);
            }
        }
        
        Map<Id,Opportunity>oppMap=New Map<Id,Opportunity>();
        For(Opportunity opp:[SELECT Id,Amount,accountId fROM Opportunity WHERE AccountId IN: accIDs]){
            oppMap.put(opp.accountId,opp);
        }
        List<Account>updatedAccs=New List<Account>();
        For(Account acc:[SELECT Id,Latest_Opportunity_Amount__c FROM Account WHERE Id IN:accIDs]){
            if(oppMap.ContainsKey(acc.Id)){
                acc.Latest_Opportunity_Amount__c=oppMap.get(acc.Id).Amount;
                
            }
            updatedAccs.add(acc);
        }
        
        if(!updatedAccs.IsEmpty()){
            update updatedAccs;
        }
        
    }
    //Requirement-When Opportunity amount is greater than 10000 and less then 50000 populate hot opportunity in description
    
    public static void populateDesc(List<Opportunity>newOppList){
        For(Opportunity opp:newOppList){
            if(opp.amount>10000 && opp.Amount<=50000){
                opp.Description='Hot Opportunity'+opp.Amount;
            }
        }
    }
    
    //Whenever opportunity stage is updated or created update opp description with opportunity stage name
    public static void populateOppStage(List<Opportunity>oppList,Map<Id,Opportunity>oldOppMap){
        
        For(Opportunity opp:oppList){
            if((oldOppMap==null)||(opp.stageName!=oldOppMap.get(opp.id).stageName)){
                opp.Description='Opportunity Stage Updated'+opp.StageName;
            }
        }
    }
    //When a opportunity stage is changes create a task 
    public static void createTask(List<Opportunity>oppList,Map<Id,Opportunity>oldOppMap){
        List<Task>TastToInsert=New List<Task>();
        For(Opportunity opp:oppList){
            if((opp.StageName!=oldOppMap.get(opp.Id).StageName)||(oldOppMap==null)){
                Task tsk=New Task();
                tsk.subject='Opp Stage Changed';
                tsk.Priority='Normal';
                tsk.status='Not Started';
                tsk.ownerID=opp.OwnerId;
                tsk.WhatId=opp.id;
                TastToInsert.add(tsk);
            }
        }
        if(!TastToInsert.IsEmpty()){
            insert TastToInsert;
        }
    }
    
    //Requirement-when opp stage is updated to closed lost and closed lost reason is not populated implement validation
    public static void customValidation(List<Opportunity>newOpps,Map<Id,Opportunity>oldOppMap){
        For(Opportunity opp:newOpps){
            if(opp.StageName!=oldOppMap.get(opp.Id).StageName && opp.StageName=='Closed Lost' && opp.StageName!='Closed Won'){
                if(opp.Closed_Lost_Reason__c==null){
                    opp.Closed_Lost_Reason__c.addError('Please Populate Lost Reason In short');
                }
            }
        }
    }
}