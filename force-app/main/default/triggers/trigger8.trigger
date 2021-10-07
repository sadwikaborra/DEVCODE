trigger trigger8 on Competitor__c(after undelete) {
    
    Set<Id> competitorsId = new Set<Id>();
    
    for (Competitor__c a: trigger.New) {
        if (trigger.isUndelete) {
            competitorsId.add(a.Id);
          }
     }
    
    List<Competitor__c> compList = [Select Id,name From Competitor__c Where Id IN :competitorsId];
        
        for(Competitor__c c: compList){
            c.Undeleted__c = true;
            }
    update compList;
   }