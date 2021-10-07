public  class hubtableDataservice {
    @AuraEnabled
    public static List<Hub__c> fetchHub() {
        List <Hub__c> HubLst =
                               [SELECT  Name, Active__c, Location__latitude__s, Location__longitude__s  FROM Hub__c LIMIT 10 ];
        
        System.debug('hello'+HubLst);
        return  HubLst;
    }
}