public class brkTRGHandler {
    
        public static void calcPrice(List<Breakfeast__c> lstofzc){
         for(Breakfeast__c a : lstofzc) {
         	a.price__c = a.qty__c * a.rate__c;
    	}
        }
    
         public static void calcPrice2(List<Breakfeast__c> lstofzc){
         for(Breakfeast__c a : lstofzc) {
         	a.price__c = (a.qty__c * a.rate__c)*2;
    	}
        }
            

}