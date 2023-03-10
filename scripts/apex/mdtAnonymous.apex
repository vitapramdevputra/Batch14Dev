Map<string, emailDomain__mdt> emails = EmailDomain__mdt.getAll();
system.debug(emails);

EmailDomain__mdt gmail = EmailDomain__mdt.getInstance('gmail');
system.debug('gmail -> ' + gmail);



//custom metadata types -> custom object -> WE JUST RETRieved it. We get it? Yes?

//custom metadata types records(data) is ALSO metadata