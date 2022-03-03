trigger brkTRG on Breakfeast__c (before insert) {
    
        //for(Breakfeast__c a : Trigger.New) {
       ///	a.price__c = a.qty__c * a.rate__c;
    	//}
    
    	//Call Trigger Handler
    	brkTRGHandler.calcPrice(Trigger.new);

}