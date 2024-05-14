public with sharing class iPL2 {
    @AuraEnabled(cacheable=true)
    public static Franchise__c[] getFranchiseDetails() {
        return [
            SELECT Team_Management__c, Support_Staff__c, Players__c, FranchiseImage__c 
            FROM Franchise__c
            ];
    }
}