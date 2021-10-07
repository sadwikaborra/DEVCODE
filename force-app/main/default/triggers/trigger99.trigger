trigger trigger99 on Line_Item__c (after insert) {
    
    Set<Id> merchId = new Set<Id>();
        
        for(Line_Item__c a: trigger.new) {
            merchId.add(a.Id);
         }
         
        List<Merchandise__c> merchUpdate = new List<Merchandise__c>();
        
       List<Merchandise__c> merchList = [Select Id, nooflineitems__c From Merchandise__c Where Id IN: merchId];
       List<Line_Item__c> merchIdList = [Select Id From Line_Item__c Where Merchandise__c IN: merchId];
        
        Integer count = merchIdList.size();
        
        for(Merchandise__c b: merchList) {
            b.nooflineitems__c = count;
            merchUpdate.add(b);
          }
        
        update merchUpdate;

}