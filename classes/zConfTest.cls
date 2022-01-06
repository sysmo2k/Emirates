/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 * Comment line 3
 */
@istest
public class zConfTest {
    
    @isTest static void Test1Test()
    {
        zConference__c t3 = new zConference__c();
        t3.Product__c = 'Burger';
        t3.Rate__c = 2.99;
        t3.Qty__c = 3;
        
        Insert t3;
        
        List<zConference__c> b = New List<zConference__c>([select id,price__c from zConference__c where id =: t3.id]);
    	
         /**
			* Calculate Price Based on Rate and QTY
			* Assert Expected Value
			* @author MOC
			*/ 
        System.assertEquals(8.97, b[0].price__c,'Price not Calculated Correctly');
        
    }

}