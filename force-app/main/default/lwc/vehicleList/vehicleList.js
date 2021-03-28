import { LightningElement, api, wire, track } from 'lwc';
import getVehiclesByStatus from '@salesforce/apex/VM_Controller.getVehiclesByStatus';
import NAME_FIELD from '@salesforce/schema/Vehicle__c.Name';
import STATUS_FIELD from '@salesforce/schema/Vehicle__c.Status__c';
import MODEL_FIELD from '@salesforce/schema/Vehicle__c.Model__c';
import NUMBER_FIELD from '@salesforce/schema/Vehicle__c.Plate_number__c';
import LAST_DATE_FIELD from '@salesforce/schema/Vehicle__c.Last_Maintenance_Date__c';
import NEXT_DATE_FIELD from '@salesforce/schema/Vehicle__c.Next_Maintenance_Date__c';

const ACTIONS = [
    { label: 'Show Maintenance Records', name: 'related_maintenance'},
];

const NOT_AVAILABLE_STATUS = 'Not Available';
const AT_SERVICE_STATUS = 'At Service';
const AVAILABLE_STATUS = 'Available';
const ALL = 'All';

const filterOptions = [
    { value: NOT_AVAILABLE_STATUS, label: NOT_AVAILABLE_STATUS },
    { value: AT_SERVICE_STATUS, label: AT_SERVICE_STATUS },
    { value: AVAILABLE_STATUS, label: AVAILABLE_STATUS },
    { value: ALL, label: ALL },
];

const COLUMNS = [
    { label: 'Name', fieldName: NAME_FIELD.fieldApiName, sortable: true, type: 'text'},
    { label: 'Plate Number', fieldName: NUMBER_FIELD.fieldApiName, type: 'text'},
    { label: 'Model', fieldName: MODEL_FIELD.fieldApiName, type: 'text'},
    { label: 'Status', fieldName: STATUS_FIELD.fieldApiName, type: 'text'},
    { label: 'Last Maintenance Date', fieldName: LAST_DATE_FIELD.fieldApiName, sortable: true, type: 'date'},
    { label: 'Next Maintenance Date', fieldName: NEXT_DATE_FIELD.fieldApiName,  type: 'date'},
    {
        type: 'action',
        typeAttributes: { rowActions: ACTIONS },
    },
];
export default class VehicleList extends LightningElement {
    searchStatus = ALL;
   @track columns = COLUMNS;
   @track vehicles = [];
   @track sortBy='FirstName';
   @track sortDirection='asc';
   @track currentFilter = ALL;
   @track isExpanded = false;
   filterOptions = filterOptions;
   @wire(getVehiclesByStatus, { status: '$searchStatus'})
   vehicleList({error, data}) {
    if(data)
      this.vehicles=Object.assign([], data);
    if(error)
      this.error = error;
  }

   handleRowAction(event) {
       if(event.detail.action.name === 'related_maintenance') {
            this.showList(event.detail.row.Id);
       }
   }

   showList(recordId) {
        const event = new CustomEvent('showlist', {
            detail: recordId,
        });
        this.dispatchEvent(event);
   }
  
   updateColumnSorting(event){
        let fieldName = event.detail.fieldName;
        let sortDirection = event.detail.sortDirection;
        this.sortBy = fieldName;
        this.sortDirection = sortDirection;
        this.sortData(fieldName, sortDirection);
  }
  
 
    sortData(fieldName, sortDirection) {
        let sortResult = Object.assign([], this.vehicles);
        this.vehicles = sortResult.sort(function(a,b){
        if(a[fieldName] < b[fieldName])
            return sortDirection === 'asc' ?  - 1 : 1;
        else if(a[fieldName] > b[fieldName])
            return sortDirection === 'asc' ? 1 :  - 1;
        else
            return 0;
        })
  }
    get dropdownTriggerClass() {
        if (this.isExpanded) {
            return 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click custom_list_view slds-is-open';
        } else {
            return 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click custom_list_view';
        }
    }

    handleFilterChangeButton(event) {
        this.isLoaded = false;
        const filter = event.target.dataset.filter;
        this.isExpanded = !this.isExpanded;
        if (filter !== this.currentFilter) {
            this.currentFilter = filter;
            setTimeout(() => {
                this.searchStatus = filter;
            }, 300);
        } else {
        }
    }

    handleClickExtend() {
        this.isExpanded = !this.isExpanded;
    }

}