AccountsBatch ab = new AccountsBatch();
//AccountTriggerHandler ab = new AccountTriggerHandler();
//we can pass the new instance of only those class, which IMPLEMENTS batchable.
id jobId = Database.executeBatch(ab, 50);
//Database.executeBatch(ab); //default number of record is 200.