trigger UserStoryTRG on copado__User_Story__c (before insert,before update) {
    
    List<copado__User_Story__c> myOrgs = New List<copado__User_Story__c>();
    Map<String,String> ListofOrgs = new Map<String,String>();
    Map<String,String> ListofOrgsNames = new Map<String,String>();
    Map<String,String> MapofUsers = new Map<String,String>();
    
    //Get Map of Pipeline Connections (Source Org ID, Destination Org)
    //Assume Source Org ID is unique in Map
    for(copado__Deployment_Flow_Step__c ds : [Select copado__Destination_Environment__c,copado__Source_Environment__c from copado__Deployment_Flow_Step__c])
    {
        ListofOrgs.put(ds.copado__Source_Environment__c,ds.copado__Destination_Environment__c );
    }
    for(copado__Deployment_Flow_Step__c ds : [Select Source_Org_Name__c,Destination_Org_Name__c from copado__Deployment_Flow_Step__c])
    {
        ListofOrgsNames.put(ds.Source_Org_Name__c,ds.Destination_Org_Name__c );
    }
    For(User myus: [Select id,Copado_Deploy_to_Orgs__c from User where Copado_Deploy_to_Orgs__c != null])
    {
        MapofUsers.put(myus.id,myus.Copado_Deploy_to_Orgs__c);
    }
    
    
    system.debug('ListofOrgs.keyset():' + ListofOrgs.keyset());
    system.debug('ListofOrgs.values() :'+ ListofOrgs.values());
    system.debug('ListofOrgsNames.keyset():' + ListofOrgsNames.keyset());
    system.debug('ListofOrgsNames.values() :'+ ListofOrgsNames.values());
    system.debug('MapofUsers.keyset() :' + MapofUsers.keyset());
    system.debug('MapofUsers.values() :' + MapofUsers.values());
	
    
    

    //For each Source Org - Retrieve the Destination Org
    for (copado__User_Story__c ms :Trigger.New)
    {
            if (ListofOrgs.containsKey(ms.copado__Environment__c))
            {

                ms.Destination_Environment__c  = ListofOrgs.get(ms.copado__Environment__c);
            }
            if (ListofOrgsNames.containsKey(ms.Source_Org__c))
            {

                ms.Destination_Org_Name__c   = ListofOrgsNames.get(ms.Source_Org__c);
            }
        	if (MapofUsers.containsKey(UserInfo.getUserId()))
            {
              ms.Copado_Deploy_to_Orgs__c =   MapofUsers.get(UserInfo.getUserId());
            }
        
        	if(ms.Copado_Deploy_to_Orgs__c.contains(ms.Destination_Org_Name__c))
            {
                ms.CanDeploytoOrg__c = true;
            }
        	else
            {
                ms.CanDeploytoOrg__c = false;
            }    
        
        
        
        system.debug('ms.Source_Org__c :' + ms.Source_Org__c);
        system.debug('ms.Destination_Org_Name__c :' + ms.Destination_Org_Name__c);
    }
    

    
}