@isTest
public class AccountsBatchTest {
    @isTest
   private static void testBatch1() {
        //1. Prepare data
        list<account> listAcc = new list<account>();
        for (Integer i = 0; i < 900; i++) {
            account a = new account();
            a.Name = 'batch test ' + i;
            a.Description = 'test';
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc;
        //end of prepare data

        //2 invoke batch apex, in btwn start test, stoptest
        Test.startTest();
        AccountsBatch ab = new AccountsBatch();
        Database.executeBatch(ab, 950);
        Test.stopTest();
        //end of 2.

        //assert
        list<account> allAccounts = [select id, description from account];
        for (account eachAccount : allAccounts) {
            assert.isTrue(eachAccount.Description.containsIgnoreCase('batch'));
        }
        
   }
}