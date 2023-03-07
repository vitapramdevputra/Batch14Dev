try{
    account a = new account();
    insert a;
} catch(DmlException dmlex){
    system.debug('dml went wrong buddy');
} catch(Exception ex){
    system.debug('something went wrong buddy');
}


system.debug('Apex is SIMPLE');