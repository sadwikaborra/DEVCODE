global class SecondBatch implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
          return Database.getQueryLocator('Select id, (Select id FROM Contacts) from Account');
       }
 global void execute(Database.BatchableContext bc, List<Account> acclst )
    {   
        list<Account> al=new list<Account>();
        system.debug('in execution method');
           for(Account acc : acclst)
            {
                if(acc.Contacts.size() != null)
                  {
                 acc.noofcontacts__c=acc.Contacts.size();
                      
                       al.add(acc);                      
                   }
           }
        
        UPDATE al;
    }
   
        

    global void finish(Database.BatchableContext bc)
    {
          system.debug('in finish method');
    }
  }