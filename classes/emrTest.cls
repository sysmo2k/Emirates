@istest
public class emrTest {
    
        @isTest static void Test1Test()
    {
        Emirates__c t3 = new Emirates__c();
        t3.Product__c = 'Hummus';
        t3.Rate__c = 2.99;
        t3.Qty__c = 3;
        
        Insert t3;
        
        List<Emirates__c> b = New List<Emirates__c>([select id,price__c from Emirates__c where id =: t3.id]);
    	
        // Now Calculate Price and assert expected Value
        //System.assertEquals(8.97, b[0].price__c,'Price not Calculated Correctly');
        
    }

}