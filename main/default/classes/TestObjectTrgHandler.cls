
/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 */
public with sharing class TestObjectTrgHandler {
    /**
	* Calculate Price Based on Rate and QTY
	*
	*
	*/
    public static void calcPrice(List<TestObject__c> lstofzc){
        for(TestObject__c a : lstofzc) {
            a.price__c = a.qty__c * a.rate__c;
       }
   }
}
