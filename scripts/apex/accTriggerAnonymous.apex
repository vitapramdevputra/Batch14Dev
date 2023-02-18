List<account> listAccount = new list<account>();

      account acc1 = new account();
      acc1.Name = 'trg acc1';
      acc1.ShippingCity = 'New York';
      acc1.Active__c = 'No';
      listAccount.add(acc1);

      account acc2 = new account();
      acc2.Name = 'trg acc2';
      acc2.ShippingCity = 'DC';
      acc2.Active__c = 'Yes';
      listAccount.add(acc2);

      account acc3 = new account();
      acc3.Name = 'trg acc3';
      acc3.ShippingCity = 'DC';
      acc3.Active__c = 'Yes';
      listAccount.add(acc3);

      //insert list
      insert listAccount;


    //  for (Integer i = 0; i < 15; i++) {
    //      account a = new account();
    //      a.Name = 'softinnovas '+ i;
    //      insert a;
    //   }