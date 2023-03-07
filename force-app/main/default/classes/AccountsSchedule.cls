public class AccountsSchedule implements Schedulable{
   public void execute(SchedulableContext sc){
    //start a batch
        AccountsBatch ab = new AccountsBatch();
        id jobId = Database.executeBatch(ab, 50);
   }
}