public class pgm5 {
    
     public void demo(string s1,string s2)
        {
        if(s1=='rock'&&s2=='paper')
            system.debug('player 2 won');
        else if(s1=='rock'&&s2=='scissors')
            system.debug('player 1 won');
        else if(s1=='paper'&&s2=='scissors')
            system.debug('player 2 won');
        else if(s1=='paper'&&s2=='rock')
            system.debug('player 1 won');
        else if(s1=='scissors'&&s2=='rock')
            system.debug('player 2 won');
        else if(s1=='scissors'&&s2=='paper')
            system.debug('player 1 won');
        else
            system.debug('tie');
    }

}