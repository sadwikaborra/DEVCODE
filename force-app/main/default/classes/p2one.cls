public class p2one{
    public void test()
    {
        List<Merchandise__c> mList = [Select Name,(Select Name from Line_Items__r) from 	Merchandise__c];
        Map<Merchandise__c, List<Line_Item__c>> mMap = new Map<Merchandise__c, List<Line_Item__c>>();
        
        for(Merchandise__c mRec: mList)
        {
            mMap.put(mRec,mRec.Line_Items__r);
        }
        System.debug(mMap);
    }
}