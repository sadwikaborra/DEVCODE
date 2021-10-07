trigger Trigger3 on Invoice__c (before delete) {

  for (Invoice__c i:trigger.old)
    {
         if(i.Status__c=='Closed')
           {
            i.addError('NOT ALLOWED TO DELETE A RECORD');
           }
    }

}