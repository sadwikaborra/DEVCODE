trigger trigger4 on Merchandise__c (after update){
    
if(trigger.isAfter && trigger.isUpdate) {
        TriggerHandler4.unitPrice(trigger.New);   
}
}