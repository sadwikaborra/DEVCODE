public class InsertCaseRecords {
    
    public static void insertRecord(){
            
       Group queue = [SELECT Id  FROM Group Where Type ='Queue' AND DeveloperName = 'CaseQueue'];

           List<Case> caseList1 = new List<Case>();

              for (Integer i = 0; i<4; i++) {
                       Case c = new Case();
                          c.Subject = 'CaseSubject';
                          c.Origin = 'Email';
                          c.OwnerId  = queue.Id;
                           caseList1.add(c);
                     }

          insert caseList1;
         }

}