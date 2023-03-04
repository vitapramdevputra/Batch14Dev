trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if (Trigger.isafter && trigger.isinsert) {
        system.debug('call method now...');

        SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
        
        system.debug('method JUST called...');
        //call handler method here.
        SPTriggerHandler.createDefaultTicket(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before update project trigger called');
        //validate status complete method
        //SPTriggerHandler.validateStatusCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    if(Trigger.isAfter && Trigger.isUpdate){
       SPTriggerHandler.projectStatusChange(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

}