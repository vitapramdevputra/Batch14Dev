@isTest
public class AccountTriggerTest {
    @isTest
    private static void testAccountInsert() {
        //how to test trigger?
            //create/update/delete/undelete records.
         //3 account records here.
        //1. prepare data
        Account acc = new account();
        acc.Name = 'test 1';
        acc.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'test 2';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'test 3';
        acc3.Industry = 'Banking';

        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;
    }

    @isTest
    private static void testAccountUpdate() {
        Account acc = new account();
        acc.Name = 'test 1';
        acc.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'test 2';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'test 3';
        acc3.Industry = 'Banking';

        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;

        for (account eachAc : listAcc) {
            eachAc.Description = 'test update';
        }
        update listAcc;
    }
}