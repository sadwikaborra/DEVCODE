public class lgt {
    @AuraEnabled
    public static List<Bike__c> getBikes(String hubId){
        List<Bike__c> bikeList = [Select Id,Name,(SELECT Id,Name,BookingTime__c,Customer__r.name,Customer__r.status__c FROM Bookings__r) FROM Bike__c where hub__c=:hubId];
              system.debug('bikeList-- '+bikeList.size());
                 return bikeList;        
}
}