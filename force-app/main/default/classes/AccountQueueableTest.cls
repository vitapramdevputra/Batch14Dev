@isTest
public class AccountQueueableTest {
   private testmethod static void testQueueueable1() {
        //prepare data
        list<account> listAcc = new list<account>();
        for (Integer i = 0; i < 200; i++) {
            account a = new account();
            a.Name = 'queueue test ' + i;
            a.Description = 'test';
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc;

        //enqueue job
        Test.startTest();
        //AccountsQueueable qa = new AccountsQueueable(listAcc);
        system.enqueueJob(new AccountsQueueable(listAcc));
        Test.stopTest();

        //assertion
        integer countSI = [select count() from account where name like '%--SI'];
        assert.areEqual(200, countSI);
   }
}