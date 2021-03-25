import { LightningElement } from 'lwc';

export default class Layout_VM extends LightningElement {
    selectedId;

   handleShowList(event) {
       this.selectedId = event.detail;
   }
}