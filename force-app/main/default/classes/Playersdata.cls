public with sharing class Playersdata {
    @AuraEnabled(cacheable=true)
    public static Player__c playerData(string recordId){
        return 
        [
            SELECT Id, Name, Last_Name__c, Birth_Place__c, Franchise__r.Name, role__c, Style__c, Age__c,
            Matches__c, Runs__c, Highest__c, Centuries__c, Half_Centuries__c, Average__c, Strike_Rate__c, 
            Wickets__c, Maidens__c, Dots__c, Economy__c, AverageB__c, Strike_RateB__c, URL__c
            FROM Player__c WHERE Id =: recordId LIMIT 1
        ];
    }
}