/**
 * @author moc <moc@polsource.com>
 * Comment line 2
 */
trigger emTRG on Emirates__c (before insert,before update) {

    //Call Trigger Handler
    emtrgHandler.calcPrice(Trigger.new);
}