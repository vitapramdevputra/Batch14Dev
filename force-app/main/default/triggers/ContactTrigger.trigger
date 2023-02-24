trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {

   if (Trigger.isBefore && Trigger.isUpdate) {
        //call validation method of handler
        //ContactTriggerHandler.contactUpdateValidation1(Trigger.new, trigger.old, trigger.newmap,trigger.oldmap);
        ContactTriggerHandler.contactUpdateValidation2(Trigger.new, trigger.old, trigger.newmap,trigger.oldmap);
   }
   if (Trigger.isAfter) {
      //call method to update rollUpsummary field
      ContactTriggerHandler.rollUpSummaryUpdate(Trigger.new, trigger.old, trigger.newmap,trigger.oldmap);
   }

}