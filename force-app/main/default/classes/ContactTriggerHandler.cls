public class ContactTriggerHandler {
    public static void contactUpdateValidation1(List<contact> conTriggerNew, List<contact> conTriggerOld,
    Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        for (contact eachContact : conTriggernew) {
            //get oldContact from oldMap using .get(key)
            contact oldContact = conTriggerOldMap.get(eachContact.id);

            if (oldContact.leadsource == 'Partner Referral') {
                //addError to validate (or throw error)
                eachContact.addError('Cannot update Partner Referral contact.');
            }
        }
    }
    public static void contactUpdateValidation2(List<contact> conTriggerNew, List<contact> conTriggerOld,
    Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        for (contact eachContact : conTriggerNew) {
            if (eachContact.LeadSource != conTriggerOldMap.get(eachContact.Id).LeadSource) {
                //throw error on LEADSOURCE field
                eachContact.LeadSource.addError('CANNOT UPDATE LEAD SOURCE. PLEASE USER!!!!');
            }
        }
    }

    public static void rollUpSummaryUpdate(List<contact> conTriggerNew, List<contact> conTriggerOld,
        Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        
            //contact created with related Account  --> Increase count of 'number of contacts' for that new account.
            //Contact update, account field changed --> INCREASE count for NEW ACCOUNT.
            //                                      --> DECREASE Count for OLD ACCOUNT.
            //Contact Deleted                       --> DECREASE Count for OLD ACCOUNT.
            //Contact UnDeleted                     --> INCREASE count for NEW ACCOUNT.


            set<id> accountIds = new set<id>();

            if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
                //for increase we Use trigger NEW
                for (contact eachCon : conTriggerNew) {
                    if(eachCon.AccountId != null){
                        accountIds.add(eachCon.AccountId);
                    }
                }
            }
            if (Trigger.isDelete || Trigger.isUpdate) {
                //OLD account for Decrease
                for (contact eachCon : conTriggerOld) {
                    if(eachCon.AccountId != null){
                        accountIds.add(eachCon.AccountId);
                    }
                }
            }

            if (!accountIds.isEmpty()) {
                list<account> listAcc = [select id, number_of_contacts__c, (select id from contacts)
                from account where id in :accountIds];
                for (account eachAcc : listAcc) {
                    integer numOfContacts = 0;
                    if (eachAcc.contacts != null) {
                        numOfContacts = eachAcc.contacts.size();
                    }
                    //set number of contacts field on account record
                    eachAcc.number_of_contacts__c = numOfContacts;
                }
                if(!listAcc.isEmpty()){
                    update listAcc;
                }
            }

    }
}