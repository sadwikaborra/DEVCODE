Public with sharing class deletemultiplecont{
  public id asgn{get;set;}
  public contact cdel = new contact();
  public deletemultiplecont(apexpages.standardsetcontroller setcon){}
  Public pagereference delmultplerec() {
      system.debug('hidden val is..!!' +asgn);
        try{
            system.debug('delete rec is..!!' +cdel);
            delete [select id from contact where id =: asgn];           
            return NULL;
        }catch(exception e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return NULL;
     } 
  }
}