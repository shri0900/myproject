public with sharing class AccountHelper {
    //Adding a sample message
    @AuraEnabled
    public static List<Account> createAccount(String accountName,String accIndustry){
       List<Account>accToInsert=New List<Account>();
        try {
             Account acc=New Account();
             acc.Name=accountName;
             acc.Industry=accIndustry;
             accToInsert.add(acc);
             if(!accToInsert.isEmpty()){
                insert accToInsert;
             }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return accToInsert;
    }

    @AuraEnabled
    public static List<Account> updateAcc(Id accountId,String accountName){

        List<Account>accList=New List<Account>();

        For(Account acc:[SELECT Id,Name FROM Account WHERE ID=:accountId]){
            acc.Name=accountName;
            accList.add(acc);
        }

        if(!accList.isEmpty()){
            update accList;
        }

        return accList;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccs(){
      List<Account>accList=New List<Account>();
        try {
            accList=[SELECT Id,Name FROm Account LIMIT 10];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return accList;
    }
}