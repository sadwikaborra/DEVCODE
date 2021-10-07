public class p2two {
    public void updateValue()
    {
        List <Invoice__c> statusList = [Select Status__c, Invoice_Total__c From Invoice__c];
        for(Invoice__c a: statusList)
        {
            if(a.Invoice_Total__c>100)
            {
                a.status__c ='Closed';
            }
        }
        update statusList;
        for(Invoice__c b: statusList)
        {
            System.debug(b);
        }
    }
}