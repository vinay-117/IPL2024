public class ManOfTheMatch {
    
    public static void decideManOfTheMatch() {
        
        List<Match__c> Listofrecords = [SELECT Player1__c, Player2__c, Player3__c, Player4__c, Player5__c, Player6__c, Player7__c, Player8__c,
                                        Player9__c, Player10__c, Player11__c, Player12__c, Player13__c, Player14__c, Player15__c, Player16__c,
                                        Balls_Faced__c, Balls_Faced_2__c, Balls_Faced_3__c, Balls_Faced_4__c, Balls_Faced_5__c,
                                        Balls_Faced_T2__c, Balls_Faced_T2_2__c, Balls_Faced_T2_3__c, Balls_Faced_T2_4__c, Balls_Faced_T2_5__c,
                                        Runs__c, Runs_2__c, Runs_3__c, Runs_4__c, Runs_5__c, Runs_T2__c, Runs_T2_2__c, Runs_T2_3__c, Runs_T2_4__c, Runs_T2_5__c,
                                        Fours__c, Fours_2__c, Fours_3__c, Fours_4__c, Fours_5__c, Fours_T2__c, Fours_T2_2__c, Fours_T2_3__c, Fours_T2_4__c, Fours_T2_5__c, 
                                        Sixes__c, Sixes_2__c, Sixes_3__c, Sixes_4__c, Sixes_5__c, Sixes_T2__c, Sixes_T2_2__c, Sixes_T2_3__c, Sixes_T2_4__c, Sixes_T2_5__c,
                                        Strike_Rate__c, Strike_Rate_2__c, Strike_Rate_3__c, Strike_Rate_4__c, Strike_Rate_5__c, 
                                        Strike_Rate_T2__c, Strike_Rate_T2_2__c, Strike_Rate_T2_3__c, Strike_Rate_T2_4__c, Strike_Rate_T2_5__c,
                                        Wickets__c, Wickets_2__c, Wickets_3__c, Wickets_T2__c, Wickets_T2_2__c, Wickets_T2_3__c,
                                        Economy__c, Economy_2__c, Economy_3__c, Economy_T2__c, Economy_T2_2__c, Economy_T2_3__c,
                                        Dots__c, Dots_2__c, Dots_3__c, Dots_T2__c, Dots_T2_2__c, Dots_T2_3__c, Man_Of_The_Match__c,
                                        Maidens__c, Maidens_2__c, Maidens_3__c, Maidens_T2__c, Maidens_T2_2__c, Maidens_T2_3__c FROM Match__c];
 
        List<matchPoint__c> matchTotalpoints = new  List<matchPoint__c>();
        string currentId;
        
        if(!Listofrecords.isEmpty()) {
             for (Match__c match : Listofrecords) {
                 currentId = match.Id;
                 
            	 Decimal player1 = calculatePlayerPoints(match.Runs__c, match.Fours__c, match.Sixes__c, match.Strike_Rate__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player1__c,match.Id,integer.valueOf(player1)));
                 
            	 Decimal player2 = calculatePlayerPoints(match.Runs_2__c, match.Fours_2__c, match.Sixes_2__c, match.Strike_Rate_2__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player2__c,match.Id,integer.valueOf(player2)));
                 
                 Decimal player3 = calculatePlayerPoints(match.Runs_3__c, match.Fours_3__c, match.Sixes_3__c, match.Strike_Rate_3__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player3__c,match.Id,integer.valueOf(player3)));
                 
                 Decimal player4 = calculatePlayerPoints(match.Runs_4__c, match.Fours_4__c, match.Sixes_4__c, match.Strike_Rate_4__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player4__c,match.Id,integer.valueOf(player4)));
                 
                 Decimal player5 = calculatePlayerPoints(match.Runs_5__c, match.Fours_5__c, match.Sixes_5__c, match.Strike_Rate_5__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player5__c,match.Id,integer.valueOf(player5)));
                 
                 Decimal player6 = calculatePlayerPoints(0, 0, 0, 0, match.Dots__c, match.Wickets__c, match.Maidens__c, match.Economy__c);
                 matchTotalpoints.add(returnpoints(match.Player6__c,match.Id,integer.valueOf(player6)));
                 
                 Decimal player7 = calculatePlayerPoints(0, 0, 0, 0, match.Dots_2__c, match.Wickets_2__c, match.Maidens_2__c, match.Economy_2__c);
                 matchTotalpoints.add(returnpoints(match.Player7__c,match.Id,integer.valueOf(player7)));
                 
                 Decimal player8 = calculatePlayerPoints(0, 0, 0, 0, match.Dots_3__c, match.Wickets_3__c, match.Maidens_3__c, match.Economy_3__c);
                 matchTotalpoints.add(returnpoints(match.Player8__c,match.Id,integer.valueOf(player8)));
                 
                 Decimal player9 = calculatePlayerPoints(match.Runs_T2__c, match.Fours_T2__c, match.Sixes_T2__c, match.Strike_Rate_T2__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player9__c,match.Id,integer.valueOf(player9)));
                 
                 Decimal player10 = calculatePlayerPoints(match.Runs_T2_2__c, match.Fours_T2_2__c, match.Sixes_T2_2__c, match.Strike_Rate_T2_2__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player10__c,match.Id,integer.valueOf(player10)));
                 
                 Decimal player11 = calculatePlayerPoints(match.Runs_T2_3__c, match.Fours_T2_3__c, match.Sixes_T2_3__c, match.Strike_Rate_T2_3__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player11__c,match.Id,integer.valueOf(player11)));
                 
                 Decimal player12 = calculatePlayerPoints(match.Runs_T2_4__c, match.Fours_T2_4__c, match.Sixes_T2_4__c, match.Strike_Rate_T2_4__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player12__c,match.Id,integer.valueOf(player12)));
                 
                 Decimal player13 = calculatePlayerPoints(match.Runs_T2_5__c, match.Fours_T2_5__c, match.Sixes_T2_5__c, match.Strike_Rate_T2_5__c, 0, 0, 0, 0);
                 matchTotalpoints.add(returnpoints(match.Player13__c,match.Id,integer.valueOf(player13)));
                 
                 Decimal player14 = calculatePlayerPoints(0, 0, 0, 0, match.Dots_T2__c,  match.Wickets_T2__c, match.Maidens_T2__c, match.Economy_T2__c);
                 matchTotalpoints.add(returnpoints(match.Player14__c,match.Id,integer.valueOf(player14)));
                 
                 Decimal player15 = calculatePlayerPoints(0, 0, 0, 0, match.Dots_T2_2__c, match.Wickets_T2_2__c, match.Maidens_T2_2__c, match.Economy_T2_2__c);
                 matchTotalpoints.add(returnpoints(match.Player15__c,match.Id,integer.valueOf(player15)));
                 
                 Decimal player16 = calculatePlayerPoints(0, 0, 0, 0, match.Dots_T2_3__c, match.Wickets_T2_3__c, match.Maidens_T2_3__c, match.Economy_T2_3__c);
                 matchTotalpoints.add(returnpoints(match.Player16__c,match.Id,integer.valueOf(player16)));

                
                 if(matchTotalpoints.size()>0){
                     insert matchTotalpoints;
                 }
             
            
                 System.debug('Match: ' + match.Id + ' Player 1 Points: ' + player1);
                 System.debug('Match: ' + match.Id + ' Player 2 Points: ' + player2);
                 System.debug('Match: ' + match.Id + ' Player 3 Points: ' + player3);
                 System.debug('Match: ' + match.Id + ' Player 4 Points: ' + player4);
                 System.debug('Match: ' + match.Id + ' Player 5 Points: ' + player5);
                 System.debug('Match: ' + match.Id + ' Player 6 Points: ' + player6);
                 System.debug('Match: ' + match.Id + ' Player 7 Points: ' + player7);
                 System.debug('Match: ' + match.Id + ' Player 8 Points: ' + Player8);
                 System.debug('Match: ' + match.Id + ' Player 9 Points: ' + Player9);
                 System.debug('Match: ' + match.Id + ' Player 10 Points: ' + player10);
                 System.debug('Match: ' + match.Id + ' Player 11 Points: ' + player11);
                 System.debug('Match: ' + match.Id + ' Player 12 Points: ' + player12);
                 System.debug('Match: ' + match.Id + ' Player 13 Points: ' + player13);
                 System.debug('Match: ' + match.Id + ' Player 14 Points: ' + player14);
                 System.debug('Match: ' + match.Id + ' Player 15 Points: ' + player15);
                 System.debug('Match: ' + match.Id + ' Player 16 Points: ' + player16);
        	}
    }
        
        Decimal matchpoints;
        AggregateResult[] results = [select max(points__c) points, Match__c  from matchPoint__c where Match__c =:currentId group by Match__c];
        for(AggregateResult res:results){
             matchpoints = (Decimal)res.get('points');
        }
		integer pnt = Integer.Valueof(matchpoints);
              STRING mat = [SELECT Id, player__c FROM matchPoint__c WHERE points__c = :pnt limit 1].player__c;
        System.debug(mat);
        
    
    	Listofrecords[0].Man_Of_The_Match__c = mat;
   
        Update Listofrecords;
    
    
    }
    
    public static Decimal calculatePlayerPoints(Decimal runs, Decimal fours, Decimal sixes, Decimal strikeRate, Decimal dots, Decimal wickets, Decimal maidens, Decimal economy) {
        Decimal playerPoints = 0;

        if (runs != null) {
             playerPoints += runs;  																				// Each Run
        }
        if (runs >= 100) {
             playerPoints += 8; 																					// Century
        }
        if (runs >= 50) {
            playerPoints += 4;
        } 																					                        // Half Century
        if (fours != null) {
            playerPoints += fours;  																				// Four
        }
        if (sixes != null) {
            playerPoints += sixes * 2;  																			// Six
        }

        if (strikeRate >= 150) {
            playerPoints += 4;  																					// Strike Rate
        }
        system.debug('playerpoints '+playerPoints);
        
        if (wickets >0) {
            playerPoints += (wickets*15);  																					// Wickets
        }

        if(maidens > 0) {
            playerPoints += 6;  																					// Maidens
        }

        if(dots >= 10) {
            playerPoints += 3;  																					// Dots
        }
        
        if(economy <= 6.5) {
            playerPoints += 5;  																					// Economy
        }

        return playerPoints;
    }
	
    public static matchPoint__c returnpoints(string playerId,string matchId, Integer points){
        matchPoint__c mt = new matchPoint__c();
        mt.Player__c = playerId;
        mt.Match__c = matchId;
        mt.points__c = points;
        return mt;
    }
}