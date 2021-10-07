public class CaseRoundRobinHandler {
    
    //@InvocableMethod(Description='To call this method from Process Builder if a Case is created through the API')
    public static void updateOwnerRoundRobin(List<Id> idList){
        list<String>ProfNameLst = new list<String>{'System Administrator','Standard Platform User'};
            set<Profile>profileList = new set<Profile>([select id,Name from Profile where Name IN :ProfNameLst]);
        Set<String> profNames = new set<String>();
        for(profile p:profileList){
            profNames.add(p.Id);
        }
         System.debug(profNames);
        if(profNames.contains(userinfo.getProfileId())||Test.isRunningTest())
        {
            
            System.debug('under if');
            List<Case> updateCase = [select id,OwnerId,CaseNumber from Case where id IN :idList];
            
            list<Id> userIdLst=new list<Id>();
            //get list of all logged in System Administrator users
            for(user u:[select Id from user where Profile.Name = 'System Administrator'  order by LastName])
            {
                userIdLst.add(u.Id);
            }
            //System.debug(userId Lst);
           
            
            system.debug('Users List:'+userIdLst);
            for(case c:updateCase){
                If(userIdLst.size()>0){
                    c.OwnerId = userIdLst[Math.mod(Integer.valueOf(c.CaseNumber),userIdLst.size())];
                }
            }
            update updateCase;
        }
    }

}