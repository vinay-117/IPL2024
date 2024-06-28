import { LightningElement, wire, track } from 'lwc';
import images from '@salesforce/resourceUrl/playersimg';
import franchiseimages from '@salesforce/resourceUrl/Franchise';
import playerdetails from '@salesforce/apex/IPL.playerdetails';
import playerhighestdetails from '@salesforce/apex/IPL.playerhighestdetails';
import playerCenturydetails from '@salesforce/apex/IPL.playerCenturydetails';
import playerHalfCenturydetails from '@salesforce/apex/IPL.playerHalfCenturydetails';
import playerStrikerate from '@salesforce/apex/IPL.playerStrikerate';
import playerWickets from '@salesforce/apex/IPL.playerWickets';
import playerEconomy from '@salesforce/apex/IPL.playerEconomy';
import playerAverage from '@salesforce/apex/IPL.playerAverage';
//import getFranchiseDetails from '@salesforce/apex/iPL2.getFranchiseDetails';
// LMS
// import { subscribe, MessageContext, unsubscribe } from 'lightning/messageService';
// import MESSAGE_SERVICE from '@salesforce/messageChannel/Vinay__c';
// import {NavigationMixin} from 'lightning/navigation';

export default class IPL extends LightningElement {

    
    cr = images + '/players/Cricket.jpg';
    cs = franchiseimages + '/Franchise/CSK.png';
    rc = franchiseimages + '/Franchise/RCB.png';
    mi = franchiseimages + '/Franchise/MI.png';
    kr = franchiseimages + '/Franchise/KKR.png';
    sh = franchiseimages + '/Franchise/SRH.png';
    gt = franchiseimages + '/Franchise/GT.png';
    lg = franchiseimages + '/Franchise/LSG.png';
    dc = franchiseimages + '/Franchise/DC.png';
    rr = franchiseimages + '/Franchise/RR.png';
    pk = franchiseimages + '/Franchise/KPXI.png';

    // franchiseImages = [
    //     {Name:this.cs},
    //     {Name:this.rc},
    //     {Name:this.mi},
    //     {Name:this.kr},
    //     {Name:this.sh},
    //     {Name:this.gt},
    //     {Name:this.lg},
    //     {Name:this.dc},
    //     {Name:this.rr},
    //     {Name:this.pk}
    // ]
    // franchiseFieldDetails

    record={}
    showRecord
    error;
    // columns = columns;
    // @track playerData = [];
    @track playerObj;

    //Load content from LMS
    // @wire(MessageContext)
    // messageContext


    // WIRE
    @wire(playerdetails)
    wiredplayerdetails(result){
        this.playerObj = result;
        if(result.error){
            this.playerObj = undefined;
        }

    }

    @track playerObj2;

    @wire(playerhighestdetails)
    wiredplayerhighestdetails(result){
        this.playerObj2 = result;
        if(result.error){
            this.playerObj2 = undefined;
        }
    }

    @track playerObj3;
    @wire(playerCenturydetails)
    wiredplayercenturydetails(result){
        this.playerObj3 = result;
        if(result.error){
            this.playerObj3 = undefined;
        }
    }

    @track playerObj4;
    @wire(playerHalfCenturydetails)
    wiredplayerhalfcenturydetails(result){
        this.playerObj4 = result;
        if(result.error){
            this.playerObj4 = undefined;
        }
    }

    @track playerObj5;
    @wire(playerStrikerate)
    wiredplayerstrikerate(result){
        this.playerObj5 = result;
        if(result.error){
            this.playerObj5 = undefined;
        }
    }

    @track playerObj6;
    @wire(playerWickets)
    wiredplayerWickets(result){
        this.playerObj6 = result;
        if(result.error){
            this.playerObj6 = undefined;
        }
    }
    
    @track playerObj7;
    @wire(playerEconomy)
    wiredplayerEconomy(result){
        this.playerObj7 = result;
        if(result.error){
            this.playerObj7 = undefined;
        }
    }

    @track playerObj8;
    @wire(playerAverage)
    wiredplayerAverage(result){
        this.playerObj8 = result;
        if(result.error){
            this.playerObj8 = undefined;
        }
    }

    // handleclick(){
    //     this[NavigationMixin.Navigate]({
    //         type: 'standard__component',
    //         attributes: {
    //             componentName: 'lightning__AppPage' 

    //         }
    //     });
    // }

    // getrecords(){
    //     getFranchiseDetails().then(result=>{
    //         console.log(result)
    //         this.franchiseFieldDetails = result
    //     })
    //     .catch(error=>{
    //         console.log(error)
    //     })
    // }

    // connectedCallback(){
    //     this.subscribeHandler()
    // }

    // @wire(getFranchiseDetails)
    // records({data, error}){
    //     if(data){
    //         this.franchiseFieldDetails = data
    //         console.log(data)
    //     }
    //     if(error){
    //         console.error(error)
    //     }
    // }
    // subscribeHandler(){
    // subscribe(this.messageContext, MESSAGE_SERVICE, (message) => this.handleTeamSelected(message))
    // }

    // handleTeamSelected(message){
    //     this.record = message.franchise
    //     this.showRecord = showData
    //     console.log(message)
    // }

    handleData(event){
        console.log('Selected Image Id', event.detail)
    }
}