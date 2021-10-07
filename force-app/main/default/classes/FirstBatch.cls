global  class FirstBatch implements Database.Batchable<Sobject>{
     global Database.QueryLocator start(Database.BatchableContext bc)
     {
         return Database.getQueryLocator('select name from Account');
     } 
     global void execute(Database.BatchableContext bc,List<Account> scope){
         System.debug('In execute method');
          for(Account a: scope){
                a.name = a.name+'Absyz';
              }
          Update Scope;
       } 
     global void finish(Database.BatchableContext bc){
         System.debug('In finish method');
     }
     
}