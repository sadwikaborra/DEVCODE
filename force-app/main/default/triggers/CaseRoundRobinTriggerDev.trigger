trigger CaseRoundRobinTriggerDev on Case (after insert) {
    
    
     List<Id> caseIds = new List<Id>();
    if(trigger.isAfter){
        
        if(trigger.isInsert){
            
            for(Case c:Trigger.new){
                
              if(c.Origin=='Web')
                {
                caseIds.add(c.Id);
                }
            }
            System.debug(caseIds);
           CaseRoundRobinHandler.updateOwnerRoundRobin(caseIds);
        }
        
    }
}