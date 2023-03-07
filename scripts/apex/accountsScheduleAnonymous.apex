string crn = '0 0 13 * * ?';

AccountsSchedule acs = new AccountsSchedule();
system.schedule('accountSchedule22', crn, acs);