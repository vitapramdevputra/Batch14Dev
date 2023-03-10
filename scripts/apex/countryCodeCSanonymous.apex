//list type custom setting
Map<string, country_code__c> countryCodes = country_code__c.getAll();
system.debug('countryCode map ' + countryCodes);

//print -> Country is United States, its code is USA

for (string eachName : countryCodes.keySet()) {
    country_code__c eachRecord = countryCodes.get(eachName);
    system.debug('county is ' + eachName + ', its code is ' + eachRecord.code__c);
}

//if we want to get JUST one value directly
 country_code__c ccIndia = country_code__c.getInstance('India');
 system.debug(ccIndia);
 system.debug('ccIndia code ' + ccIndia.code__c);