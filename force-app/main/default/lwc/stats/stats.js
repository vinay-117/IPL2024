import { LightningElement, wire, track } from 'lwc';
import playerimages from '@salesforce/resourceUrl/players';
import playerRecords from '@salesforce/apex/PlayerStats.playerRecords';
import playerWRecords from '@salesforce/apex/PlayerStats.playerWRecords';
import playerHRecords from '@salesforce/apex/PlayerStats.playerHRecords';
import playerBBAverage from '@salesforce/apex/PlayerStats.playerBBAverage';
import playerBeconomy from '@salesforce/apex/PlayerStats.playerBeconomy';
import playerBstrikerate from '@salesforce/apex/PlayerStats.playerBstrikerate';
import playerMcenturies from '@salesforce/apex/PlayerStats.playerMcenturies';
import playerMhalfcenturies from '@salesforce/apex/PlayerStats.playerMhalfcenturies';
import playerMmaidens from '@salesforce/apex/PlayerStats.playerMmaidens';
import {NavigationMixin} from 'lightning/navigation';

export default class Stats extends NavigationMixin(LightningElement) {
    vk = playerimages + '/players/ViratKohli.png';
    yc = playerimages + '/players/YuzvendraChahal.png';
    kl = playerimages + '/players/KLRahul.png';
    as = playerimages + '/players/AbhishekSharma.png';
    ar = playerimages + '/players/AjinkyaRahane.png';
    td = playerimages + '/players/TimDavid.png';
    vrK = playerimages + '/players/ViratKohli.png';
    dw = playerimages + '/players/Davidwarner.png';
    nu = playerimages + '/players/NaveenUlHaq.png';

    // data;
    // HRName
    // HRLName
    // HRRuns
    BName
    BLName
    Hwickets
    HSName
    HSLName
    HSHighest
    AName
    ALName
    BAverage
    EName
    ELName
    BeEconomy
    BSName
    BSLName
    BSRate
    CeName
    CeLName
    pcenturies
    HCName
    HCLName
    PHCent
    MName
    MLName
    MMaidens
    HighestrId
    HighestwId
    HighestsId
    HighestaId
    HighesteId
    HighestsrId
    HighestctId
    HighesthctId
    HighestmId

    @wire(playerRecords)
    wiredPlayerRecords({ data, error }) {
        if (data) {
            // this.playerData = data;
            this.HRName = data.Name +' '+  data.Last_Name__c;
            this.HRLName = data.Last_Name__c;
            this.HRRuns = data.Runs__c;
            this.HighestrId = data.Id;
        } else if (error) {
            console.error(error);
        }
    }

    @wire(playerWRecords)
    wiredPlayerWRecords({ data, error}){
        if(data) {
            this.BName = data.Name + ' ' + data.Last_Name__c;
            this.BLName = data.Last_Name__c;
            this.Hwickets = data.Wickets__c;
            this.HighestwId = data.Id;
        }
        else if (error) {
            console.error(error);
        }
    }

    @wire(playerHRecords)
    wiredPlayerHRecords({ data, error}){
        if(data) {
            this.HSName = data.Name + ' ' + data.Last_Name__c;
            this.HSLName = data.Last_Name__c;
            this.HSHighest = data.Highest__c;
            this.HighestsId = data.Id;
        }
        else if (error) {
            console.error(error);
        }
    }

    @wire(playerBBAverage)
    wiredPlayerBBAverage({ data, error }){
        if(data){
            this.AName = data.Name + ' ' + data.Last_Name__c;
            this.ALName = data.Last_Name__c;
            this.BAverage = data.Average__c;
            this.HighestaId = data.Id;
        }
        else if (error){
            console.error(error);
        }
    }

    @wire(playerBeconomy)
    wiredPlayerBeconomy({ data, error}){
        if(data){
            this.EName = data.Name + ' ' + data.Last_Name__c;
            this.ELName = data.Last_Name__c;
            this.BeEconomy = data.Economy__c;
            this.HighesteId = data.Id;
        }
        else if (error){
            console.error(error);
        }
    }

    @wire(playerBstrikerate)
    wiredPlayerBstrikerate({ data, error}){
        if(data){
            this.BSName = data.Name + ' ' + data.Last_Name__c;
            this.BSLName = data.Last_Name__c;
            this.BSRate = data.Strike_Rate__c;
            this.HighestsrId = data.Id;
        }
        else if (error){
            console.error(error);
        }
    }

    @wire(playerMcenturies)
    wiredPlayerMcenturies({ data, error}){
        if(data){
            this.CeName = data.Name + ' ' + data.Last_Name__c;
            this.CeLName = data.Last_Name__c;
            this.pcenturies = data.Centuries__c;
            this.HighestctId = data.Id;
        }
        else if (error){
            console.error(error);
        }
    }

    @wire(playerMhalfcenturies)
    wiredPlayerMhalfcenturies({ data, error}){
        if(data){
            this.HCName = data.Name + ' ' + data.Last_Name__c;
            this.HCLName = data.Last_Name__c;
            this.PHCent = data.Half_Centuries__c;
            this.HighesthctId = data.Id;
        }
        else if (error){
            console.error(error);
        }
    }

    @wire(playerMmaidens)
    wiredPlayerMmaidens({ data, error}){
        if(data){
            this.MName = data.Name + ' ' + data.Last_Name__c;
            this.MLName = data.Last_Name__c;
            this.MMaidens = data.Maidens__c;
            this.HighestmId = data.Id;
        }
        else if (error){
            console.error(error);
        }
    }

        handleClick(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighestrId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }

        handleClick2(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighestwId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }

        handleClick3(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighestsId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }

        handleClick4(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighestaId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }

        handleClick5(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighesteId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }

        handleClick6(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighestsrId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }

        handleClick7(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighestctId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }

        handleClick8(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighesthctId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }

        handleClick9(){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.HighestmId,
                    objectApiName: 'Player__c',
                    actionName: 'view'
                },
            });
        }  
}