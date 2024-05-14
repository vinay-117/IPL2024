@isTest
private class ManOfTheMatchTest {

    @isTest
    static void testDecideManOfTheMatch() {
        List<Match__c> testMatches = new List<Match__c>();
        String Id;
        insert testMatches;

        //decideManOfTheMatch
        Test.startTest();
        ManOfTheMatch.decideManOfTheMatch();
        Test.stopTest();
        
        List<Match__c> updatedMatches = [SELECT Id, Player1__c, Runs__c, Fours__c, Sixes__c, Strike_Rate__c, Dots__c, Wickets__c, Maidens__c, Economy__c,
                                         Player2__c, Runs_2__c, Fours_2__c, Sixes_2__c, Strike_Rate_2__c, Dots_2__c, Wickets_2__c, Maidens_2__c, Economy_2__c
                                         FROM Match__c WHERE Id IN :testMatches];

        System.assertEquals(testMatches.size(), updatedMatches.size(), 'Number of matches should remain the same');

        for (Match__c match : updatedMatches) {
            System.assertNotEquals(null, match.Man_Of_The_Match__c, 'Man of the Match should be determined');
        }
    }

    @isTest
    static void testCalculatePlayerPoints() {
        Decimal playerPoints = ManOfTheMatch.calculatePlayerPoints(60, 1, 1, 160, 2, 0, 5, 6.0);
    }

    @isTest
    static void testReturnPoints() {
        matchPoint__c mt = ManOfTheMatch.returnpoints('00N5h00000Hxcwe', 'a025h00000wOWcJAAW', 0);
        
    }
}