<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
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
</Workflow>