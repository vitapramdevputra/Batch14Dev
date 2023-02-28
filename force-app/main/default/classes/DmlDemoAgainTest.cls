@isTest
public class DmlDemoAgainTest {
    @isTest
    private static void testInsertStndObj() {
        //call method
        DmlDemoAgain.dmlDemoInsert_stndObj1();
        //verify
        //soql
        list<account> accs = [select id, name from account where name = 'Softinnovas'];
        //assert
        system.assertEquals(1, accs.size());
        system.assertEquals('Softinnovas', accs[0].Name);
    }

    @isTest
    private static void testInsertCustmObj() {
        DmlDemoAgain.dmlDemoInsert_cstmObj(); //it will insert record in test world

        //verify. to verify, we do SOQL and get the record here.
        List<Salesforce_Project__c> listSP = [select id, name, project_name__c from Salesforce_Project__c];
        system.assertEquals('Learn dml', listSP[0].project_name__c);
    }

    @isTest
    private static void testUpdateDemo_stndObj2() {
        //1. Prepare data
        Account acc = new account();
        acc.Name = 'Softinnovas';
        insert acc;


        //this method NEEDs one account with name 'Softinnovas.'
        DmlDemoAgain.dmlUpdateDemo_stndObj2();

        //verify.
        //soql
        Account updatedAcc = [select id, name, phone from account limit 1];
        //assert
        system.assertEquals('Softinnovas Inc.', updatedAcc.Name);
        assert.areEqual('Softinnovas Inc.', updatedAcc.Name);
    }

    @isTest
    private static void testInsertDemo_stndObj2() {
         //1. Prepare data
         Account acc = new account();
         acc.Name = 'Softinnovas';
         insert acc;


        //2. call method
        DmlDemoAgain.dmlInsertDemo_stndObj2();

        //verify that contact is created
        //soql
        contact con = [select lastname, accountid from contact where LastName='Biden' limit 1];
        assert.areEqual(acc.id, con.AccountId);//new method

        system.assertEquals(acc.Id, con.accountid);//old method.
    }

    @isTest
    private static void testInsert_cstmObj2() {
        //1. prepare data
        //create project
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'test project';
        insert sp; //5 sec cpu time is consumed here.


        //call method
         //to actually test this method we now have only 5 sec cpu time available
        Test.startTest();
       //RESET governor limit. We will again have 10 sec of cpu time available.
        DmlDemoAgain.dmlDemoInsert_cstmObj2();
        Test.stopTest();


        //continue with previous gov limit. 5 sec cpu time for rest of the code.
        
        //verify.
        //soql
        Salesforce_Ticket__c sst = [select subject__c, priority__c, 
        status__c, salesforce_project__c from Salesforce_Ticket__c WHERE
        Subject__c = 'create related record via apex' ];
        assert.areEqual(sp.Id, sst.Salesforce_Project__c);
        assert.areEqual('High', sst.Priority__c);
    }
}