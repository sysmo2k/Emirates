/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 * Comment line 3
 */
@istest
public class TestObject_Test {
    @isTest static void test1Test()
    {
        TestObject__c t3 = new TestObject__c();
        t3.Product__c = 'Burger';
        t3.Rate__c = 2.99;
        t3.Qty__c = 3;
        
        Insert t3;
        
        List<TestObject__c> b = New List<TestObject__c>([select id,price__c from TestObject__c where id =: t3.id]);
    	
         /**
			* Calculate Price Based on Rate and QTY
			* Assert Expected Value
			* @author MOC
			*/ 
        System.assertEquals(8.97, b[0].price__c,'Price not Calculated Correctly');
        
    }
}
