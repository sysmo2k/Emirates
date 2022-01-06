/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 */
public class zConfTrgHandller {
    /**
	* Calculate Price Based on Rate and QTY
	*
	*
	*/
    public static void calcPrice(List<zConference__c> lstofzc){
         for(zConference__c a : lstofzc) {
         	a.price__c = a.qty__c * a.rate__c;
    	}
    }

}