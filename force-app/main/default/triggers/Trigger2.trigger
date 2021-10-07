trigger Trigger2 on Invoice__c (before insert) {
    
   for(Invoice__c i: trigger.new)
    {
        i.Name=i.Name+'Absyz';
    }

}