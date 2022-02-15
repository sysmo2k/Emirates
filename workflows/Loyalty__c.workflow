<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_New_Programme</fullName>
        <field>New_Programme__c</field>
        <formula>TEXT( Programme__c )</formula>
        <name>Update New Programme</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Old_Miles</fullName>
        <field>Old_Miles__c</field>
        <formula>PRIORVALUE( Miles__c )</formula>
        <name>Update Old Miles</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Old_Programme</fullName>
        <field>Old_Programme__c</field>
        <formula>Text(PRIORVALUE( Programme__c ))</formula>
        <name>Update Old Programme</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Check Miles Changes</fullName>
        <actions>
            <name>Update_Old_Miles</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Miles__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Programme</fullName>
        <actions>
            <name>Update_New_Programme</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Old_Programme</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Programme__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>