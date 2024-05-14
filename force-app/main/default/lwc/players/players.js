import { LightningElement, api, wire } from 'lwc';
import playerData from '@salesforce/apex/Playersdata.playerData';
// import Rohit_Sharma from '@salesforce/resourceUrl/RohitSharma';
// import Dhoni from '@salesforce/resourceUrl/Dhoni';
// import PLAYER_OBJECT from '@salesforce/schema/Player__c';
// import FIRST_NAME from '@salesforce/schema/Player__c.First_Name__c';
// import LAST_NAME from '@salesforce/schema/Player__c.Last_Name__c';
// import RUNS from '@salesforce/schema/Player__c.Runs__c';

export default class Players extends LightningElement { 

    player

    showbatdata = true
    showballdata = false

    @api recordId
   
    @wire(playerData, {recordId: '$recordId'})
    player({data, error}){
        if(data){
            this.player = data
            console.log(data)
        }

        if(error){
            console.error(error)
        }
    }

    
    handleClickBat(event){
        console.log('inside bat')
        this.showbatdata = true
        this.showballdata = false
        console.log('bat',this.showbatdata)
    }

    handleClickBall(event){
        this.showballdata = true
        this.showbatdata = false
        console.log(this.showballdata)
    }
}