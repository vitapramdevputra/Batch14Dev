public class SPTriggerHandler {
   public static void createDefaultTicket(list<salesforce_project__c> spTriggerNew) {
        try {
            //get org default value using below method from Hierarchy custom setting
            DefaultTicketInfo__c dtInfo;
            
            //if user is system admin, then get value of system admin profile.
            //else use default value
            
            Profile adminProfile = [select id, name from profile where name = 'System Administrator'];
            if(UserInfo.getProfileId() == adminProfile.Id){
                dtInfo = DefaultTicketInfo__c.getInstance(adminProfile.Id);
            } else {
                dtInfo = DefaultTicketInfo__c.getOrgDefaults();
            }

            List<Salesforce_Ticket__c> newST = new List<Salesforce_Ticket__c>();
            for (Salesforce_Project__c eachSP : spTriggerNew) {
                Salesforce_Ticket__c st = new Salesforce_Ticket__c();
                st.Subject__c = dtInfo.Subject__c;
                st.Salesforce_Project__c = eachSP.Id;
                st.Priority__c = 'High';
                st.Description__c = dtInfo.description__c;
                newST.add(st);
            }
            if (!newST.isEmpty()) {
                insert newST;
            }
        } catch(Exception ex){
            string errorMsg = system.label.CreateDefaultTicketError;
            //we will now catch the errors HERE.
            for (Salesforce_Project__c eachSP : spTriggerNew) {
                eachSP.addError(errorMsg);
            }
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

   //1. STATIC
   //2. it MUST return VOID.
   //3. parameters: primitive datatypes or collection of primitive data types
   @future
   public static void updateProjectDescription(set<id> spIds) {
        List<Salesforce_Project__c> listSP = [select id, description__c from Salesforce_Project__c where id in :spIds];
        for (Salesforce_Project__c eachSP : listSP) {
            eachSP.Description__c = 'Updated from future.';
        }
        update listSP;
   }

   //METHOD A(new, old, newmap, oldmap)
    //we will get IDs of all project where status is changed to completed.
    //call METHOD B
    public static void projectStatusChange(list<salesforce_project__c> spTriggerNew,
        list<salesforce_project__c> spTriggerOld,
        Map<id, salesforce_project__c> spTriggerNewMap,
        Map<id, salesforce_project__c> spTriggerOldMap) {
        
            set<id> projectIds = new set<id>();
            for (Salesforce_Project__c eachSP : spTriggerNew) {
                if (eachSP.status__c == 'Completed' && eachSP.Status__c != spTriggerOldMap.get(eachSP.Id).Status__c ) {
                    projectIds.add(eachSP.Id);
                }
            }
            if (!projectIds.isempty()) {
                //call future method.
                updateTicketStatus(projectIds);
            }
    }
    @testVisible
    @future
    private static void updateTicketStatus(set<id> spIds) {
        //get all tickets
        List<Salesforce_Ticket__c> listST = [select id, status__c, Salesforce_Project__c from Salesforce_Ticket__c
            Where Salesforce_Project__c in :spIds and status__c !='Completed'];
        for (Salesforce_Ticket__c st : listST) {
            st.Status__c = 'Completed';
        }
        update listST;
    }

  //METHOD B(set projectids ) (future method)
   //we can't pass here new, old, newmap, oldmap -> 
}