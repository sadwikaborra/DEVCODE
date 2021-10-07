trigger CaseRoundRobinTrigger on Case (before insert,before update) {
    
    
     if (trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){

        // Get the queue user details
        List<Group> queues = [
                SELECT Id,
                    (Select Id, UserOrGroupId FROM GroupMembers Order By ID ASC)
               FROM Group
                Where Type = 'Queue'AND DeveloperName = 'CaseQueue'
        ];

        // Get the index of the last lead assigned user in the queue
        	Case__c lrr = 	Case__c.getOrgDefaults();
        Integer userIndex = (lrr.get('UserIndex__c') == null || Integer.valueOf(lrr.get('UserIndex__c')) < -1) 
            ? -1 : Integer.valueOf(lrr.get('UserIndex__c'));

        if (queues.size() > 0 && queues.get(0).GroupMembers.size() > 0) {
            Id queueId = queues.get(0).Id;
            Integer groupMemberSize = queues.get(0).GroupMembers.size();
            for (Case l : Trigger.new) {
                if (l.OwnerId == queueId) {
                    Integer CaseUserIndex =  (userIndex + 1) >= groupMemberSize ? 0 : userIndex + 1;
                    l.OwnerId = queues.get(0).GroupMembers.get(CaseUserIndex).UserOrGroupId;
                    userIndex = CaseUserIndex;
                }
            }

            // Update the custom settings user index with the last lead assigned user
            lrr.UserIndex__c = userIndex;
            update lrr;
        }
    }
    
    
}