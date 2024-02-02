public class CaseTriggerHandler {

    //When a new case is created on account populate latest case number on account
    public static void populateLatestCaseNumber(List<Case>caseList){
        List<Account>accList=New List<Account>();
        For(Case c:caseList){
            if(c.accountId!=null){
                Account acc=New Account();
                acc.latest_Case_Number__c=c.CaseNumber;
                acc.id=c.AccountId;
                accList.add(acc);
            }
        }
        
        if(!accList.IsEmpty()){
            update accList;
        }
    }
}