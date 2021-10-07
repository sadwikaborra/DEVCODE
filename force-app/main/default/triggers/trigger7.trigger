trigger trigger7 on Opportunity (before insert) {
    Set<String> oppset= new Set<String>();
    for(Opportunity o:trigger.new)
    {
        oppset.add(o.name);
    }
 List<Competitor__c> complist  =[select id,name from Competitor__c where name in:oppset];
    if(complist.size()>0&&complist!=null){
        DELETE complist;      
    }
       
}