public with sharing class IPL {
    @AuraEnabled(cacheable=true)
    public static List<Player__c> playerdetails() {
        return 
        [
            SELECT Name, Last_Name__c, URL__c, Runs__c, Franchise__r.Name, Birth_Place__c
            FROM Player__c
            WHERE Runs__c != Null
            ORDER BY Runs__c DESC
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Player__c> playerhighestdetails() {
        return 
        [
            SELECT Name, Last_Name__c, URL__c, Franchise__r.Name, Birth_Place__c, Highest__c
            FROM Player__c
            WHERE Highest__c != Null
            ORDER BY Highest__c DESC
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Player__c> playerCenturydetails() {
        return 
        [
            SELECT Name, Last_Name__c, URL__c, Franchise__r.Name, Birth_Place__c, Centuries__c
            FROM Player__c
            WHERE Centuries__c != Null
            ORDER BY Centuries__c DESC
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Player__c> playerHalfCenturydetails() {
        return 
        [
            SELECT Name, Last_Name__c, URL__c, Franchise__r.Name, Birth_Place__c, Half_Centuries__c
            FROM Player__c
            WHERE Half_Centuries__c != Null
            ORDER BY Half_Centuries__c DESC
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Player__c> playerStrikerate() {
        return 
        [
            SELECT Name, Last_Name__c, URL__c, Franchise__r.Name, Birth_Place__c, Strike_Rate__c
            FROM Player__c
            WHERE Strike_Rate__c != Null
            ORDER BY Strike_Rate__c DESC
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Player__c> playerWickets() {
        return 
        [
            SELECT Name, Last_Name__c, URL__c, Franchise__r.Name, Birth_Place__c, Wickets__c
            FROM Player__c
            WHERE Wickets__c != Null
            ORDER BY Wickets__c DESC
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Player__c> playerEconomy() {
        return 
        [
            SELECT Name, Last_Name__c, URL__c, Franchise__r.Name, Birth_Place__c, Economy__c
            FROM Player__c
            WHERE Economy__c != Null
            ORDER BY Economy__c ASC
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Player__c> playerAverage() {
        return 
        [
            SELECT Name, Last_Name__c, URL__c, Franchise__r.Name, Birth_Place__c, AverageB__c
            FROM Player__c
            WHERE AverageB__c != Null
            ORDER BY AverageB__c ASC
            LIMIT 10
        ];
    }
}