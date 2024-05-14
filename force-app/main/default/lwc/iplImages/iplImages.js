import { LightningElement, api } from 'lwc';
// import { publish, MessageContext } from 'lightning/messageService';
// import MESSAGE_SERVICE from '@salesforce/messageChannel/Vinay__c';
// import getFranchiseDetails from '@salesforce/apex/iPL2.getFranchiseDetails';

export default class IplImages extends LightningElement {
    @api franchise={}
    showData = true

    imageHandler(){
        this.showData =! this.showData
        this.dispatchEvent (new CustomEvent('selected',{
            detail : 
                 this.franchise.Id,
                sdata : this.showData
            
        }))
    }
}