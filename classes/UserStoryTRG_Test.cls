@istest
public class UserStoryTRG_Test {
    
    @testSetup static void setup()
    {
        copado__Deployment_Flow__c pipeline = new copado__Deployment_Flow__c();
        pipeline.name='TestPipeline';
        
        insert pipeline;
        
        copado__Project__c myprj = new copado__Project__c();
        myprj.Name ='CopadoTest';
        myprj.copado__Deployment_Flow__c = pipeline.Id;
        
        insert myprj;
        
        copado__Environment__c testdev1 = new copado__Environment__c();
        testdev1.name = 'TestDev1';
        
        Insert testdev1;
        
        copado__Environment__c testdev2 = new copado__Environment__c();
        testdev2.name = 'TestDev2';
        
        Insert testdev2;
        
        copado__Environment__c testqa = new copado__Environment__c();
        testqa.name = 'TestQA';
        
        Insert testqa;
        
        copado__Org__c testdev1cred = new copado__Org__c();
        testdev1cred.name = 'TestDev1';
        testdev1cred.copado__Environment__c = testdev1.id;
        
        insert testdev1cred;
        
        copado__Org__c testdev2cred = new copado__Org__c();
        testdev2cred.name = 'TestDev2';
        testdev2cred.copado__Environment__c = testdev2.id;
        
        insert testdev2cred;
        
        copado__Org__c testqacred = new copado__Org__c();
        testqacred.name = 'TestQA';
        testqacred.copado__Environment__c = testqa.id;
        
        insert testqacred;
        
        
        copado__Deployment_Flow_Step__c  plct1 = new copado__Deployment_Flow_Step__c();
        plct1.copado__Deployment_Flow__c = pipeline.id;
        plct1.copado__Destination_Environment__c = testqa.id;
        plct1.copado__Source_Environment__c = testdev1.id;
        
        insert plct1;
        
        copado__Deployment_Flow_Step__c  plct2 = new copado__Deployment_Flow_Step__c();
        plct2.copado__Deployment_Flow__c = pipeline.id;
        plct2.copado__Destination_Environment__c = testqa.id;
        plct2.copado__Source_Environment__c = testdev2.id;
        
        insert plct2;
        
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User CanDeployuser = new User(
                        ProfileId = p.Id,
                        Alias = 'stand',
                        Email ='standarduser@test.com',
                        LastName = 'CopadoTest',
                        UserName = 'CopadoTest@test.com',
                        TimeZoneSidKey='America/Los_Angeles',
                        LocaleSidKey='en_US',
                        EmailEncodingKey='UTF-8',
                        LanguageLocaleKey='en_US',
            			Copado_Deploy_to_Orgs__c='TestDev1;TestDev2;TestQA'
        				);
            insert CanDeployuser;
        
                User NoDeployuser = new User(
                        ProfileId = p.Id,
                        Alias = 'stand',
                        Email ='standarduser@test.com',
                        LastName = 'NoCopadoTest',
                        UserName = 'NoCopadoTest@test.com',
                        TimeZoneSidKey='America/Los_Angeles',
                        LocaleSidKey='en_US',
                        EmailEncodingKey='UTF-8',
                        LanguageLocaleKey='en_US',
            			Copado_Deploy_to_Orgs__c='TestDev1;TestDev2'
        				);
            insert NoDeployuser;
        
        system.runAs(CanDeployuser){
        
        copado__User_Story__c myus = new copado__User_Story__c();
        
        myus.copado__User_Story_Title__c = 'CopadoTestTriggerPos';
        myus.copado__Project__c= myprj.Id;
        myus.copado__Org_Credential__c = testdev1cred.id;
        myus.copado__Environment__c = testdev1.id;
        
        insert myus;
        
        
        
        }
        
        system.runAs(NoDeployuser){
        
        copado__User_Story__c myus1 = new copado__User_Story__c();
        
        myus1.copado__User_Story_Title__c = 'CopadoTestTriggerNeg';
        myus1.copado__Project__c= myprj.Id;
        myus1.copado__Org_Credential__c = testdev1cred.id;
        myus1.copado__Environment__c = testdev1.id;
        
        insert myus1;
        


        }
        
    }
    
    @isTest static void testMethod1()
    {
        List<copado__Deployment_Flow_Step__c> plc = new List<copado__Deployment_Flow_Step__c>([select id from copado__Deployment_Flow_Step__c]);
        system.assertEquals(plc.size(), 2);
        
        List<User> myuser = new List<User>([select Copado_Deploy_to_Orgs__c from User where UserName='CopadoTest@test.com']);
        system.assertEquals(myuser[0].Copado_Deploy_to_Orgs__c, 'TestDev1;TestDev2;TestQA', 'Deploy to Orgs not Set Correctly on User');
        
		List<copado__User_Story__c> myusTest = new List<copado__User_Story__c>([select id,CanDeploytoOrg__c,Copado_Deploy_to_Orgs__c from copado__User_Story__c where copado__User_Story_Title__c = 'CopadoTestTriggerPos' ]);
        system.assertEquals(myusTest[0].CanDeploytoOrg__c, True, 'User Story Can deploy should be true but is false');
        
        List<copado__User_Story__c> myusTest1 = new List<copado__User_Story__c>([select id,CanDeploytoOrg__c,Copado_Deploy_to_Orgs__c from copado__User_Story__c where copado__User_Story_Title__c = 'CopadoTestTriggerNeg' ]);
        system.assertEquals(myusTest1[0].CanDeploytoOrg__c, False, 'User Story Can deploy should be false but is true');
   
    }


}