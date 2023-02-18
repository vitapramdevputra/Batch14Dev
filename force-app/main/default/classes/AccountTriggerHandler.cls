public class AccountTriggerHandler {
    public static void updateDescription(List<account> accTriggerNew, List<account> accTriggerOld,
                                        Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldmap) {
        for (Account eachAccount : accTriggerNew) {
            if(trigger.isInsert && eachAccount.active__c == 'Yes'){
                //update descrption field
                //how to update description?
                    //set the value
                eachAccount.Description = 'Account is active now. Enjoy buddy!';
            }
            if(trigger.isUpdate){
                //check if active field is changed from No or --None-- to Yes.
                //how to check if active field is changed?
                    //old and new value is not same
                
                //new active field
                string newActive = eachAccount.Active__c;
                //old active field???
                Account oldAccount = accTriggerOldmap.get(eachAccount.Id);
                string oldActive = oldAccount.Active__c;
                if (newActive != oldActive && newActive == 'Yes') {
                    eachAccount.Description = 'Account is active now. Enjoy Enjoy buddy!';
                }
            }
        }
    }
}