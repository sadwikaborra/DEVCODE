trigger Trigger1 on Account (before insert,before update) {
    
    for(Account a: trigger.new)
    {
        if(a.Industry=='Agriculture')
        {
            a.Rating='Hot';
        }
        else if(a.Industry=='Consulting')
        {
            a.Rating='Warm';
        }
        else if(a.Industry=='Electronics')
        {
            a.Rating='Cold';
        }
        else if(a.Industry=='Other')
        {
            a.Rating='null';
        }
    }
  
}