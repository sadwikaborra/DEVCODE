global class SecondSchedule implements Schedulable{
   
    global void execute(SchedulableContext sc)
    {
       SecondBatch sb=new SecondBatch();
         Database.executeBatch(sb);
    }

 }