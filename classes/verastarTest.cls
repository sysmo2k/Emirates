/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 * Comment line 3
 */
@istest
public class verastarTest {
        @isTest static void Test1Test()
    {
        verastar__c t3 = new verastar__c();
        t3.Product__c = 'Burger';
        t3.Rate__c = 2.99;
        t3.Qty__c = 3;
        
        Insert t3;
        
        List<verastar__c> b = New List<verastar__c>([select id,price__c from verastar__c where id =: t3.id]);
    	
        // Now Calculate Price and assert expected Value
        System.assertEquals(8.97, b[0].price__c,'Price not Calculated Correctly');
        
    }

}