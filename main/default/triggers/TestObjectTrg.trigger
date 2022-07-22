/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 */
trigger TestObjectTrg on SOBJECT (before insert,before update) {

         	//for(zConference__c a : Trigger.New) {
        // 	a.price__c = a.qty__c * a.rate__c;
    	//}
    
    	//Call Trigger Handler
    	TestObjectTrgHandler.calcPrice(Trigger.new);

}