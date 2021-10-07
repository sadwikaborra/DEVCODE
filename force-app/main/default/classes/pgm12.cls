public class pgm12{
    
   public void demo(integer n)
   {
     for(integer i=1;i<=n;i++)
     {
         for(integer j=1;j<=n;j++)
         {
             if(i==1 || i==n || j==1 || j==n)
                System.debug('#');
             else
                System.debug(' ');
         }
     }
   }
}