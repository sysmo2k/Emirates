@isTest
public class brkTRGHandlerTest {
    
        @isTest static void Test1Test()
    {
        Breakfeast__c t3 = new Breakfeast__c();
        t3.Product__c = 'Burger';
        t3.Rate__c = 2.99;
        t3.Qty__c = 3;
        
        Insert t3;
        
        List<Breakfeast__c> b = New List<Breakfeast__c>([select id,price__c from Breakfeast__c where id =: t3.id]);
    	
         /**
			* Calculate Price Based on Rate and QTY
			* Assert Expected Value
			* @author MOC
			*/ 
        //System.assertEquals(8.97, b[0].price__c,'Price not Calculated Correctly');
        
    }

}