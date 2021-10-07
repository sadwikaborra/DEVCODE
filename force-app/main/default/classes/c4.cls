public class c4{

list<account> acc;

list<contact> con;

public list<account> accList{get;set;}

public Pagereference showall(){

accList=[select name, industry from account order by lastmodifieddate desc limit 10];

return null;

}

}