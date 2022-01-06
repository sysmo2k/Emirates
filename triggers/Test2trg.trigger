trigger Test2trg on Test2__c (before insert,before update) {
    
            for(Test2__c a : Trigger.New) {
         	a.Price__c = a.Qty__c * a.Rate__c;
    }

}