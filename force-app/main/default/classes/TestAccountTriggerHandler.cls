@isTest
public class TestAccountTriggerHandler {

    @isTest
    public static void testupdateRating(){
        List<Account>accToInsert=New List<Account>();
        
        For(Integer i=0;i<10;i++){
            Account acc=New Account();
            acc.name='Test acc'+i;
            acc.Industry='Media';
            accToInsert.add(acc);
        }
        test.startTest();
        if(!accToInsert.IsEmpty()){
            insert accToInsert;
        }
        test.stopTest();
        
        List<Account>newAccList=[SELECT Id,Rating FROM Account WHERE ID=:accToInsert[0].Id];
        System.assertEquals('Hot',newAccList[0].Rating);
    }
    
    @IsTest
    public static void testcopyBillingAddressToShippingAddress(){
        List<Account>accList=New List<Account>();
        
        For(Integer i=0;i<10;i++){
            Account acc=New Account();
            acc.name='Test Acc'+i;
            acc.Copy_Billing_Address_to_Shipping_Address__c=true;
            acc.BillingCity='Test City';
            acc.BillingCountry='Test Country';
            acc.BillingState='Test State';
            acc.BillingPostalCode='416115';
            accList.add(acc);
        }
        
        test.startTest();
        insert accList;
        test.stopTest();
        List<Account>updatedAccList=[SELECT Id,Shippingstate FROM Account WHERE ID=:accList[0].Id];
        
        System.assertEquals('Test State',updatedAccList[0].ShippingState);
    }
    
    @Istest
    public static void testcreateOpps(){
        List<Account>newAccList=New List<Account>();
        
        For(Integer i=0;i<10;i++){
            Account acc=New Account();
            acc.Name='Test';
            newAccList.add(acc);
        }
        test.startTest();
        if(!newAccList.IsEmpty()){
            insert newAccList;
        }
        test.stopTest();
        
        List<Opportunity>newOppList=[SELECT AccountId,Name FROM Opportunity WHERE AccountId=:newAccList[0].Id];
        System.assertEquals('Test Trigger',newOppList[0].Name);
        
    }
   
}