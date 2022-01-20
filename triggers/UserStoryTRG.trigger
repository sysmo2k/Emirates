//User Story trigger to filter User Storys based on Multi Select Picklist field in User Object - Copado_Deploy_to_Orgs__c
//Look at Pipeline and all Pipeline Connections
//Collect Source and Destination for Each
//Populare User Story with Destination Org based on Source and Pipeline
//Compare Copado_Deploy_to_Orgs__c field and see if it contains Destination Org
//If Yes - Set CanDeploytoOrg__c to true else set to false - Default
//This is then used in a simple Validation rule which will stop the Submitting of User Story if they can't deploy to Org
//20th Jan 2022
//MOC
//martin_oconnell@epam.com
//Please Amend Trigger to tie into any Client Trigger Framework by adding the Handlder
//User Story trigger does not need to run on Insert - as its impossible to create a US and Commit without at least 1 Insert and 1 Subsequent Update

trigger UserStoryTRG on copado__User_Story__c (before update) {
    
    //First we need to check if 2 fields have changed
    //
    
    
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
        
    }
    

    
}