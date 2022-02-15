trigger verastarTRG on VeraStar__c (before insert,before update) {
    
    //Call Trigger Handler
    	verastarTrgHandller.calcPrice(Trigger.new);

}