global class FirstSchedule implements Schedulable {
    
    global void execute(SchedulableContext sc)
    {
       FirstBatch fb=new FirstBatch();
        Database.executeBatch(fb);
    }

}