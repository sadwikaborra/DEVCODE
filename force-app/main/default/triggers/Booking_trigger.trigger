trigger Booking_trigger on Booking__c (before insert) {

    loction_class.loction_method(trigger.new);

}