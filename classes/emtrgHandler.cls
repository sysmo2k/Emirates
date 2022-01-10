/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 */
public class emtrgHandler {
    /**
	* Calculate Price Based on Rate and QTY
	*
	* @author MOC
	*/
    public static void calcPrice(List<Emirates__c> lstofzc){
         for(Emirates__c a : lstofzc) {
         	a.price__c = a.qty__c * a.rate__c;
    	}
    }
}