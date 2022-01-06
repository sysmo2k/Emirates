/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 */
trigger zConfTrg on zConference__c (before insert,before update) {
    
     	//for(zConference__c a : Trigger.New) {
        // 	a.price__c = a.qty__c * a.rate__c;
    	//}
    
    	//Call Trigger Handler
    	zConfTrgHandller.calcPrice(Trigger.new);

}