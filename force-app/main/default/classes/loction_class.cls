public class loction_class {
    public  static void loction_method(list<booking__c> bok){
      //  set<id> triggerid = new set<id>();
        double distance1;
        double fare;
    

       for(Booking__c book : [select StartLocation__Latitude__s,ExpectedFare__c,ActualFare__c , StartLocation__c,
                               EndLocation__c, RecordType.Name, StartLocation__longitude__s, EndLocation__latitude__s,
                               EndLocation__longitude__s from Booking__c LIMIT 100]){ 
       /* for (Booking__c book1 : bok){
            triggerid.add(book1.id);
        }
        for(Booking__c book : [select StartLocation__Latitude__s,ExpectedFare__c,ActualFare__c , StartLocation__c,
                               EndLocation__c, RecordType.Name, StartLocation__longitude__s, EndLocation__latitude__s,
                               EndLocation__longitude__s from Booking__c where id in :triggerid]){*/
      list <booking__c> books = new list<booking__c>();
            if((book.StartLocation__c != null) && (book.EndLocation__c != null)){
            Location loc1 = Location.newInstance(book.StartLocation__Latitude__s, book.StartLocation__Longitude__s);
            Location loc2 = Location.newInstance(book.EndLocation__Latitude__s, book.EndLocation__Longitude__s);
            distance1 = Location.getDistance(loc1, loc2, 'km');
           
                if(distance1 < 15){
                    fare= distance1*1 + (distance1/50)*1.7 ;
                    
                }
                 if(distance1 >= 15){
                     fare = 15 + (distance1-15)*2 + (distance1/50)*1.7;
                 }
                book.ExpectedFare__c=fare;
             book.Distance_KMs__c = distance1;
                  	
                
                books.add(book);
            
        }
           update books;
       
        }
    }
}
//}