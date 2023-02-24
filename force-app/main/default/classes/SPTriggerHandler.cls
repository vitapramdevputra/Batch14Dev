public class SPTriggerHandler {
   public static void createDefaultTicket(list<salesforce_project__c> spTriggerNew) {
        List<Salesforce_Ticket__c> newST = new List<Salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Default ST';
            st.Salesforce_Project__c = eachSP.Id;
            newST.add(st);
        }
        if (!newST.isEmpty()) {
            insert newST;
        }
   }

   public static void validateStatusCompletion(list<salesforce_project__c> spTriggerNew,
   list<salesforce_project__c> spTriggerOld,
   Map<id, salesforce_project__c> spTriggerNewMap,
   Map<id, salesforce_project__c> spTriggerOldMap) {

        set<id> spIds = new set<id>();
        //get all sp ids where status is changed to completed.
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            //check if status is changed.
            //and new status is completed
            if (eachSP.status__c != spTriggerOldMap.get(eachSP.id).status__c
                && eachSP.status__c == 'Completed') {
                    spIds.add(eachSP.Id);
            }
        }

        if (!spIds.isEmpty()) {
            //get the list of tickets which are NOT completed for spIds.
            List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
                                                    where Salesforce_Project__c in :spIds and status__c != 'Completed'];
            for (Salesforce_Ticket__c eachST : listST) {
                //throw error in project
                Id projectId = eachST.Salesforce_Project__c;
                //get new salesforceproject.
                salesforce_project__c newProject = spTriggerNewMap.get(projectId);
                newProject.status__c.addError('Cannot complete project because all tickets are NOT completed.');
            }
        }
   }
}