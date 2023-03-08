List<account> listAccounts = new list<account>();

Account a = new account();
a.Name = 'test accccccc';
listAccounts.add(a);

Account a1 = new account();
a1.Name = 'test acccccccddddd';
listAccounts.add(a1);

Account a2 = new account();
listAccounts.add(a2);

Account a3 = new account();
listAccounts.add(a3);

// insert listAccounts; //how many accounts will be inserted with this DML? 0, and it will throw error also.

//param1: list of accounts to insert
//param2: true -> insert all records or NONE of them even if any one record has error.
//Database.insert(listAccounts, true);

//param1: list of accounts to insert
//param2: false -> insert good records and it will NOT insert bad ones.
List<Database.SaveResult> listResult = Database.insert(listAccounts, false);
//database.saveresult one record for each account.
    //we are inserting 4 account records, so listResult will have 4 records in it. 
//.isSuccess -> true if successfully inserted. Else returns false.
for (Database.SaveResult eachResult : listResult) {
    if (eachResult.isSuccess()) {
        system.debug('account record inserted succesfully, account record id is ' + eachResult.getId());
    } else{
        system.debug('account insert FAILED. Error is ' + eachResult.getErrors());
    }
}


//USE database.insert(list, false) wherever possible.
