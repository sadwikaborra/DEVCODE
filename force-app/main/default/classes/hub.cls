public class hub {
     @AuraEnabled
    public static List<Hub__c> getHubRecord(){
        
        List<Hub__c> hublsp=[SELECT  Name, Active__c, Location__latitude__s, Location__longitude__s,Rating__c  FROM Hub__c  LIMIT 10 ];
        return hublsp;
    }
}