@istest
public class Test2trg_Test {
    @isTest static void Test1Test()
    {
        Test2__c t3 = new Test2__c();
        t3.Product__c = 'Burger';
        t3.Rate__c = 2.99;
        t3.Qty__c = 3;
        
        Insert t3;
        
        List<Test2__c> b = New List<Test2__c>([select id,price__c from Test2__c where id =: t3.id]);
    	//System.assertEquals(8.96, b[0].price__c,'Price not Calculated Correctly');
        
        //System.assertEquals(8.97, b[0].price__c,'Price not Calculated Correctly');
        
    }
}