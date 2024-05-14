public class PlayerStats {

    static Decimal Bestruns = 0;

    public static void usePlayerstats(){
        
        
        List<Stats__c> slist = new List<Stats__c>();

        List<Stats__c> statslist = [
                                    SELECT Most_runs__c, Most_Wickets__c, Most_Highest__c, Best_Batting_Average__c, Best_Economy__c, 
                                    Best_Strike_Rate__c, Most_Centuries__c, Most_Half_Centuries__c, Most_Maidens__c, Most_Dots__c 
                                    FROM Stats__c
                                    ];
        
        
        if(statslist.size()>0){
          
        //Decimal Bestruns=0;
        Decimal wickets=0;
        Decimal highest=0;
        Decimal battingAverage=0;
        Decimal economy=5;
        Decimal strikerate=0; 
        Decimal centuries=0;
        Decimal halfcenturies=0;
        Decimal maidens=0;
        Decimal dots=0;
            
     	List<Franchise__c> Frlist = [SELECT Most_runs__c, Most_Wickets__c, Highest__c, Best_Batting_Average__c, Best_Economy__c, 
                                     Best_Strike_Rate__c, Most_Centuries__c, Most_Half_Centuries__c, Most_Maidens__c, Most_Dots__c 
                                     FROM Franchise__c];

    	for(Franchise__c Fl : Frlist){
            Bestruns = (Bestruns>Fl.Most_runs__c)?Bestruns:Fl.Most_runs__c;
            wickets = (wickets>Fl.Most_Wickets__c)?wickets:Fl.Most_Wickets__c;
            highest = (highest<Fl.Highest__c)?Fl.Highest__c:highest;
           	//highest = (highest>Fl.Highest__c)?highest:Fl.Highest__c;
            battingAverage = (battingAverage>Fl.Best_Batting_Average__c)?battingAverage:Fl.Best_Batting_Average__c;
            economy = (economy<Fl.Best_Economy__c)?economy:Fl.Best_Economy__c;
            strikerate = (strikerate>Fl.Best_Strike_Rate__c)?strikerate:Fl.Best_Strike_Rate__c;
            centuries = (centuries>Fl.Most_Centuries__c)?centuries:Fl.Most_Centuries__c;
            halfcenturies = (halfcenturies>Fl.Most_Half_Centuries__c)?halfcenturies:Fl.Most_Half_Centuries__c;
            maidens = (maidens<Fl.Most_Maidens__c)?Fl.Most_Maidens__c:maidens;
            dots = (dots>Fl.Most_Dots__c)?dots:Fl.Most_Dots__c;
    	}
            
        List<Player__c> listplayers = [SELECT Id, Runs__c FROM Player__c WHERE Runs__c =: Bestruns LIMIT 1];
        statslist[0].Most_runs__c = listplayers[0].Id;

        List<Player__c> listplayers2 = [SELECT Id, Wickets__c FROM Player__c WHERE Wickets__c =: wickets LIMIT 1];
        statslist[0].Most_Wickets__c = listplayers2[0].Id;
            
        List<Player__c> listplayers3 = [SELECT Id, Highest__c FROM Player__c WHERE Highest__c =: highest LIMIT 1];
        statslist[0].Most_Highest__c = listplayers3[0].Id;
            
        List<Player__c> listplayers4 = [SELECT Id, Average__c FROM Player__c WHERE Average__c =: battingAverage LIMIT 1];
        statslist[0].Best_Batting_Average__c = listplayers4[0].Id;
            
        List<Player__c> listplayers5 = [SELECT Id, Economy__c FROM Player__c WHERE Economy__c =: economy LIMIT 1];
        statslist[0].Best_Economy__c = listplayers5[0].Id;
            
        List<Player__c> listplayers6 = [SELECT Id, Strike_Rate__c FROM Player__c WHERE Strike_Rate__c =: strikerate LIMIT 1];
        statslist[0].Best_Strike_Rate__c = listplayers6[0].Id;
            
        List<Player__c> listplayers7 = [SELECT Id, Centuries__c FROM Player__c WHERE Centuries__c =: centuries LIMIT 1];
        statslist[0].Most_Centuries__c = listplayers7[0].Id;
            
        List<Player__c> listplayers8 = [SELECT Id, Half_Centuries__c FROM Player__c WHERE Half_Centuries__c =: halfcenturies LIMIT 1];
        statslist[0].Most_Half_Centuries__c = listplayers8[0].Id;
            
        List<Player__c> listplayers9 = [SELECT Id, Maidens__c FROM Player__c WHERE Maidens__c =: maidens LIMIT 1];
        statslist[0].Most_Maidens__c = listplayers9[0].Id;
            System.debug(listplayers9);
            
        List<Player__c> listplayers10 = [SELECT Id, Dots__c FROM Player__c WHERE Dots__c =: dots LIMIT 1];
        statslist[0].Most_Dots__c = listplayers10[0].Id;

        slist.add(statslist[0]);
        update slist;


        System.debug('Best Runs: ' + Bestruns);
        System.debug('Most Wickets: ' + wickets);
		System.debug('Most highest: ' + highest);
        System.debug('Max Average: ' + battingAverage);
        System.debug('Min Economy: ' + economy);
        System.debug('Max StrikeRate: ' + strikerate);
        System.debug('Max Centuries: ' + centuries);
        System.debug('Max Half Centuries: ' + halfcenturies);
        System.debug('Max Maidens: ' + maidens);
        System.debug('Max Dots: ' + dots);
        }
    }

        @AuraEnabled(cacheable=true)
        public static Player__c playerRecords(){
            //usePlayerstats();
            List<Stats__c> statslist = [
                                        SELECT Most_runs__c 
                                        FROM Stats__c
                                        ];

            List<Player__c> playermostruns =
            [
                SELECT Id, Name, Last_Name__c, Birth_Place__c, Runs__c
                FROM Player__c where Id =:statslist[0].Most_runs__c
            ];
            System.debug('Player Most Runs:' + playermostruns);
            return playermostruns[0];  
        }

    @AuraEnabled(cacheable=true)
    public static Player__c playerWRecords(){
        //usePlayerstats();
        List<Stats__c> statslist = [
                                    SELECT Most_Wickets__c 
                                    FROM Stats__c
                                    ];

        List<Player__c> playermostwickets =
            [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Wickets__c
            FROM Player__c where Id =:statslist[0].Most_Wickets__c
        ];
        System.debug('Player Most Wickets:' + playermostwickets);
        return playermostwickets[0]; 
    }

    @AuraEnabled(cacheable=true)
    public static Player__c playerHRecords(){
        //usePlayerstats();
        List<Stats__c> statslist = [
                                    SELECT Most_Highest__c 
                                    FROM Stats__c
                                    ];

        List<Player__c> playermosthighest =
            [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Highest__c
            FROM Player__c where Id =:statslist[0].Most_Highest__c
        ];
        System.debug('Player Most Highest:' + playermosthighest);
        return playermosthighest[0]; 
    }

    @AuraEnabled(cacheable=true)
    public static Player__c playerBBAverage(){
        //usePlayerstats();
        List<Stats__c> statslist = [
                                    SELECT Best_Batting_Average__c 
                                    FROM Stats__c
                                    ];

        List<Player__c> playerBestaverage =
            [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Average__c
            FROM Player__c where Id =:statslist[0].Best_Batting_Average__c
        ];
        System.debug('Player Best Batting Average:' + playerBestaverage);
        return playerBestaverage[0]; 
    }

    @AuraEnabled(cacheable=true)
    public static Player__c playerBeconomy(){
        //usePlayerstats();
        List<Stats__c> statslist = [
                                    SELECT Best_Economy__c 
                                    FROM Stats__c
                                    ];

        List<Player__c> playerBesteconomy =
            [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Economy__c
            FROM Player__c where Id =:statslist[0].Best_Economy__c
        ];
        System.debug('Player Highest Economy:' + playerBesteconomy);
        return playerBesteconomy[0]; 
    }

    @AuraEnabled(cacheable=true)
    public static Player__c playerBstrikerate(){
        //usePlayerstats();
        List<Stats__c> statslist = [
                                    SELECT Best_Strike_Rate__c 
                                    FROM Stats__c
                                    ];

        List<Player__c> playerBestsrate =
        [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Strike_Rate__c
            FROM Player__c where Id =:statslist[0].Best_Strike_Rate__c
        ];
        System.debug('Player Highest StrikeRate:' + playerBestsrate);
        return playerBestsrate[0]; 
    }

    @AuraEnabled(cacheable=true)
    public static Player__c playerMcenturies(){
        //usePlayerstats();
        List<Stats__c> statslist = [
                                    SELECT Most_Centuries__c 
                                    FROM Stats__c
                                    ];

        List<Player__c> playercenturies =
        [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Centuries__c
            FROM Player__c where Id =:statslist[0].Most_Centuries__c
        ];
        System.debug('Player Most Centuries:' + playercenturies);
        return playercenturies[0]; 
    }

    @AuraEnabled(cacheable=true)
    public static Player__c playerMhalfcenturies(){
        //usePlayerstats();
        List<Stats__c> statslist = [
                                    SELECT Most_Half_Centuries__c 
                                    FROM Stats__c
                                    ];

        List<Player__c> playerhalfcenturies =
        [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Half_Centuries__c
            FROM Player__c where Id =:statslist[0].Most_Half_Centuries__c
        ];
        System.debug('Player Most Half Centuries:' + playerhalfcenturies);
        return playerhalfcenturies[0]; 
    }

    @AuraEnabled(cacheable=true)
    public static Player__c playerMmaidens(){
        //usePlayerstats();
        List<Stats__c> statslist = [
                                    SELECT Most_Maidens__c 
                                    FROM Stats__c
                                    ];

        List<Player__c> playermaidens =
        [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Maidens__c
            FROM Player__c where Id =:statslist[0].Most_Maidens__c
        ];
        System.debug('Player Most Maidens:' + playermaidens);
        return playermaidens[0]; 
    }
}