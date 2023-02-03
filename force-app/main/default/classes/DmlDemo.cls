public class DmlDemo {
   public static void dmlDemoInsert_stndObj1() {
    //1. create new instance
    account acc = new account();
    //2. set field values
    acc.Name = 'Softinnovas';
    //final
    insert acc; //this will create a new record.
   }
   public static void dmlDemoInsert_cstmObj() {
    Salesforce_Project__c sp = new Salesforce_Project__c();
    sp.Project_Name__c = 'Learn dml';
    sp.Description__c = 'learn dml batch14';
    sp.Status__c = 'New';

    insert sp;
   }
   public static void dmlUpdateDemo_stndObj1() {
    Account ac = new account();
    ac.Name = 'Salesforce';
    system.debug('before inserting ac ' + ac);
    insert ac;
    system.debug('record is inserted now ac: ' + ac);

    //we now have ID in accounts instane 'ac'
    //we need ID if we want to update a record. 
    ac.Name = 'Salesforce Inc.';
    //update
    update ac;
   }
   public static void dmlUpdateDemo_stndObj2() {
    account acc = [select id, name from account where name like 'Softinnovas%' limit 1];
    //now set new field value
    acc.Name = 'Softinnovas Inc.';
    acc.Phone = '9876543214';
    update acc;
    system.debug('acc ' + acc);
   }
   public static void dmlInsertDemo_stndObj2() {
    account acc = [select id, name from account where name like 'Softinnovas%' limit 1];
    //create contact instance
    contact c = new contact();
    c.LastName = 'Biden';
    //setting relationship
    c.AccountId = acc.Id;
    insert c;
   }
}