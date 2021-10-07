public class acc {
     @AuraEnabled
    public static List<Account> getAccountRecord(){
        
        List<Account> acclsp=[select Name, Phone, AnnualRevenue, Website,type,Rating from Account order by lastmodifieddate DESC limit 10];
        return acclsp;
    }
}