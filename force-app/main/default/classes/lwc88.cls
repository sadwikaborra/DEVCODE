public with sharing class lwc88 {
        @AuraEnabled(cacheable=true)
        public static List<Contact> findContacts(String searchKey){

            String key = '%' + searchKey + '%';
                List<Contact> c= [
                    SELECT  Name, Email
                    FROM Contact
                    WHERE Name LIKE :key 
                    LIMIT 10
                ];
            return c;

        }
    
            
     

}