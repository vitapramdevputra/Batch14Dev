public class AccountUpdateHelper {
    @invocableMethod
    public static void updateAccountWebsite(list<Id> accIds) {
        list<account> listAccount = [select id, website from account where id in :accIds];
        for (account eachAccount : listAccount) {
            eachAccount.Website = 'www.softinnovas.com';
        }
        update listAccount;
    }
}