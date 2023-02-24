trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update) {
    if (Trigger.isafter && trigger.isinsert) {
        //call handler method here.
        SPTriggerHandler.createDefaultTicket(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        //validate status complete method
        SPTriggerHandler.validateStatusCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}