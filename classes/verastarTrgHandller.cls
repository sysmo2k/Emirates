public with sharing class verastarTrgHandller {
        /**
	* Calculate Price Based on Rate and QTY
	*
	* @author MOC
	*/
    public static void calcPrice(List<verastar__c> lstofzc){
         for(verastar__c a : lstofzc) {
         	a.price__c = a.qty__c * a.rate__c;
    	}
    }

}