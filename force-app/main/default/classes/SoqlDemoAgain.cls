public class SoqlDemoAgain {
    public static void accounSOQL_1() {
        list<account> listAcc = [select id, name, phone from account order by createddate desc];
        system.debug('list of accounts ' + listAcc);
    }

    public static void accounSOQL_11() {
        account acc = [select id, name, phone from account order by createddate desc limit 1];
        system.debug('accounts acc ' + acc);
    }

    public static void accountSOQL_2() {
        account acc = [select id, name, phone, AccountNumber from account order by createddate desc limit 1];
        system.debug('accounts acc ' + acc);
        string aName = acc.name;
        string aPhone = acc.Phone;
        system.debug('account name is ' + aName + ', phone is ' + aPhone + ', account number is ' + acc.AccountNumber);
    }

    public static void accountSOQL_3() {
        list<account> listAccount = [select id, name, phone, accountnumber from account order by createddate];

        for (account eachAccount : listAccount) {
            system.debug('---eachaccount loop start---');
            system.debug('each account record : ' + eachAccount);
            string accName = eachAccount.Name;
            string accPhone = eachAccount.Phone;
            system.debug('account name is ' + accName + ', account phone is ' + accPhone + ', acc number is '+ eachAccount.accountnumber);
            system.debug('---eachaccount loop END---');
        }

    }
    public static void accountFilter_SOQL() {
        string accountNameFilter = 'sForce';
        list<account> listAcc = [select id, name from account where name = :accountNameFilter];
        system.debug('list acc ' + listAcc);
    }
    public static void accountFilter_SOQL(string accountNameFilter) {
        list<account> listAcc = [select id, name from account where name = :accountNameFilter];
        system.debug('list acc ' + listAcc);
    }
    public static void childToParent_SOQL1() {
        list<contact> listContact = [select id, name, phone, account.name, account.industry from contact where account.industry = 'energy'];
        for (contact eachContact : listContact) {
            string accName = eachContact.account.name;
            system.debug('contact name is ' + eachContact.Name + ', its account is ' + accName);
            //system.debug(eachContact.account.Type);
        }
    }
    public static void parentToChild_SOQL1() {
        list<account> listAcc = [select name, annualrevenue, 
                            (select name, amount from opportunities where stagename = 'Closed won') 
                            from account where type = 'Customer - direct'];
        for (account eachAcc : listAcc) {
            system.debug('account name is ' + eachAcc.Name + ', acc annual revenue ' + eachAcc.AnnualRevenue);
            list<Opportunity> eachAccOpp = eachAcc.Opportunities;
            system.debug('-------');
            for (Opportunity eachOpp : eachAccOpp) {
                system.debug('opp name ' + eachopp.Name + ', amount is ' + eachOpp.Amount);
            }
            system.debug('_______');
        }
    }

    //projects, and its tickets.
    //2 req
        //1. total tickets for each PROJECT.
        //2. high priority ticket for each PROJECT.
    public static void parentToChild_SOQL2() {
        list<salesforce_project__c> listSP = [select name, project_name__c, 
                    (select subject__c, priority__c from salesforce_tickets__r) 
                    from salesforce_project__c];
        //for each loop on project
        for (salesforce_project__c eachSP : listSP) {
            //1. total tickets.
            List<salesforce_ticket__c> listST = eachSP.salesforce_tickets__r;
            integer totalTickets = listST.size();
            integer highPriorityST = 0;
            //check each ticket's priority field. if it is 'high' then increment
            for (salesforce_ticket__c eachST : listST) {
                //check if priority == 'High'
                if (eachST.priority__c == 'High') {
                    highPriorityST++;
                }
            }
            system.debug('Project name ' + eachSP.name + ', total tickets ' + totalTickets + ' high priority tickets are ' + highPriorityST);

        }
    }
}