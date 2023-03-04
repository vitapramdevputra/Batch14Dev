public class AccountsQueueable implements Queueable{
    list<account> listaccount = new list<account>();

    //this is a parameterized constructor.
    public AccountsQueueable(List<account> accs) {
        listaccount = accs;
    }

    public void execute(QueueableContext qc){
        system.debug('inside execute method listaccount => ' + listaccount);
        //update name of all accounts in listaccount.
            //append --SI in account name
        for (account eachAcc : listaccount) {
            eachAcc.Name += '--SI';
        }
        update listaccount;
    }
}