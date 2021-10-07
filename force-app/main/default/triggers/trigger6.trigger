trigger trigger6 on Contact (before insert, before update) {
    for (Contact a: trigger.New) {
        if(a.AccountId != Null) {
            Id b = a.AccountId;
            List<Contact> contactList = [Select Id, Primary_Contact__c From Contact Where Primary_Contact__c = true and AccountId =: b];
            if(contactList.size() > 0) {
                a.addError('No more primary Contacts');
            }
        }
    }
}