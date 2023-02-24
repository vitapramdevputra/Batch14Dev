public class AccountTriggerHandler {
    public static void updateDescription(List<account> accTriggerNew, List<account> accTriggerOld,
                                        Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldmap) {
        for (Account eachAccount : accTriggerNew) {
            boolean updateDesc = false;
            if(trigger.isInsert && eachAccount.active__c == 'Yes'){
                //update descrption field
                //how to update description?
                    //set the value
                updateDesc = true;
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
                    updateDesc = true;
                }
            }
            if (updateDesc) {
                eachAccount.Description = 'Account is active now. Enjoy Enjoy Enjoy buddy!';
            }
        }
    }

    public static void updateVIPforContact(List<account> accTriggerNew, List<account> accTriggerOld,
                                Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldmap) {
        //set of account ids where VIP is changed
        set<id> accIds = new set<id>();
        for (account eachAccount : accTriggerNew) {
            //how to check if VIP is changed?
                //old vip != new vip
            if (eachAccount.VIP__c != accTriggerOldMap.get(eachAccount.Id).vip__c) {
                accIds.add(eachAccount.id);
            }
        }

        //run soql query and update and everything ONLY IF we have at-least one acc id.
        if(!accIds.isEmpty()){
            //get contacts for all accounts where vip is changed.
            //how how how???? SOQL. SOQL. SOQL.
            list<contact> listContacts = [select id, vip__c, accountid from contact where accountid in :accIds];

            for (contact eachContact : listContacts) {
                //update VIP field of eachContact same as its account's VIP field.
                //first we get here account's VIP field value
                Account newAcc = accTriggerNewMap.get(eachContact.accountId);
                boolean accVIP = newAcc.vip__c;

                //update contact's VIP field
                eachContact.vip__c = accVIP;
            }
            if (!listContacts.isempty()) {
                update listContacts;
            }
        }

        
    }
}