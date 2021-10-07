public class p2four {
    public void test()
    {
        List<Invoice__c> orderCompleteInList = [Select Order_Complete__c From Invoice__c];
        List<Merchandise__c> orderCompleteMerList = [Select Order_Complete__c From Merchandise__c];
        
          for(Merchandise__c a:orderCompleteMerList)
        {
            for(Invoice__c b:orderCompleteInList)
            {
                if(a.Order_Complete__c == True)
                {
                    b.Order_Complete__c = True;
                }
            }
        }
        update orderCompleteInList;
        System.debug(orderCompleteInList);
    }
}