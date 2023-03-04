@isTest
public class SPTriggerHandlerTest {
    @isTest
    public static void testFutureMethod1() {
        //1. Prepare data
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn test';
        sp.Description__c = 'learn dml batch14';
        sp.Status__c = 'New';
    
        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Learn future test';
        sp2.Description__c = 'learn dml batch14';
        sp2.Status__c = 'New';
    
        List<Salesforce_Project__c> listSP = new List<Salesforce_Project__c>{sp, sp2};
        insert listSP;

        set<id> spIds = new set<id>{sp.id, sp2.id};

        Test.startTest();
        //call future method
        SPTriggerHandler.updateProjectDescription(spIds);
        Test.stopTest();

        //assert.
        List<Salesforce_Project__c> allSP = [select id, description__c from Salesforce_Project__c];
        for (Salesforce_Project__c s : allSP) {
            assert.isTrue(s.Description__c.contains('future'));
        }
    }
}