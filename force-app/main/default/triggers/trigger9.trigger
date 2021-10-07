trigger trigger9 on Account(before delete)
{
    Set<String> aset=new Set<String>();
    for(Account a:trigger.new)
    {
        aset.add(a.name);
    }
    
    List<Contact> clist=[select id,name from Contact where name in : aset];
    
    for(Contact c:clist){

    if(clist.size()>3 && clist!=null){
        
        c.adderror('You cant');
    }
    }
}