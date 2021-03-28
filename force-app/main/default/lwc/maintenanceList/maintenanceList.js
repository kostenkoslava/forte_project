import { LightningElement, api, wire, track } from 'lwc';
import { updateRecord, deleteRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getRelatedMaintenances from '@salesforce/apex/VM_Controller.getRelatedMaintenances';
import insertMaintenance from '@salesforce/apex/VM_Controller.insertMaintenance';
import MAINTENANCE_OBJECT from '@salesforce/schema/Maintance__c';
import NAME_FIELD from '@salesforce/schema/Maintance__c.Name';
import STATUS_FIELD from '@salesforce/schema/Maintance__c.Maintenance_status__c';
import START_DATE_FIELD from '@salesforce/schema/Maintance__c.Maintenance_start_date__c';
import DUE_DATE_FIELD from '@salesforce/schema/Maintance__c.Maintenance_due_date__c';
import REPORT_FIELD from '@salesforce/schema/Maintance__c.Maintenance_Report__c';

const COLUMNS = [
    { label: 'Name', fieldName: NAME_FIELD.fieldApiName, sortable: true, type: 'text' },
    { label: 'Status', fieldName: STATUS_FIELD.fieldApiName, type: 'text' },
    { label: 'Start date', fieldName: START_DATE_FIELD.fieldApiName, type: 'date', editable: true },
    { label: 'Due date', fieldName: DUE_DATE_FIELD.fieldApiName, type: 'date', editable: true },
    { label: 'Report', fieldName: REPORT_FIELD.fieldApiName, type: 'text', editable: true },
    { label: 'Service', fieldName: 'serv'}
];

export default class MaintenanceList extends LightningElement {
    @track columns = COLUMNS;
    @track draftValues = [];
    @track recordsCount = 0;
    @track isModalOpen = false;
    @track maintRecord = MAINTENANCE_OBJECT;
    @track maintenances;
    @track error;
    fields = {}
    isDeleteButtonDisabled = true;
    selection = [];
    _vehicleId = undefined;
    
    @wire(getRelatedMaintenances, { vehicleId: '$_vehicleId'})
    wiredRecord({data, error}) {
        if(data) {
            const newData = data.map((item) => 
            Object.assign({}, item, {serv: item.Service__r.Name})
            )
            this.maintenances = newData;
        }
        if(error) {
            this.error = error;
        }
    }
    
    

    set vehicleId(value) {
        this._vehicleId = value;
    }

    @api get vehicleId() {
        return this._vehicleId;
    }
    handleSave(event) {
        const recordInputs = event.detail.draftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });

        const promises = recordInputs.map(recordInput => updateRecord(recordInput));

        Promise.all(promises).then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Maintenance updated',
                    variant: 'success'
                })
            );
            this.draftValues = [];
            return refreshApex(this.maintenances);
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating record',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        });        
    }

    rowSelection(evt) {
        console.log(this.maintenances, NAME_FIELD.fieldApiName)
        this.recordsCount = evt.detail.selectedRows.length;
        const selectedRecords = [];
        evt.detail.selectedRows.forEach(row => selectedRecords.push(row.Id));
        this.isDeleteButtonDisabled = (this.recordsCount > 0) ? false : true;
        this.selectedRecords = selectedRecords;
    }

    deleteMaintenances() {
        if(this.selectedRecords.length > 0) {
            const promises = [];
            this.selectedRecords.forEach(record => promises.push(deleteRecord(record)));
            Promise.all(promises).then(() =>{
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Maintenance deleted',
                        variant: 'success'
                    })
                );                
                this.selectedRecords = [];
                this.isDeleteButtonDisabled = true;
                return refreshApex(this.maintenances);
            }).catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting record',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            }); 
        }
    }

    openModal() {
        this.isModalOpen = true;
    }
    closeModal() {
        this.isModalOpen = false;
    }
    handleStartChange(evt) {
        this.maintRecord.Maintenance_start_date__c = evt.target.value;
    }
    handleDueChange(evt) {
        this.maintRecord.Maintenance_due_date__c = evt.target.value;
    }
    handleReportChange(evt) {
        this.maintRecord.Maintenance_Report__c = evt.target.value;
    }
    createRecord() {
        this.maintRecord.Vehicle__c = this._vehicleId;
        if(this.maintenances.length > 0) {
            this.maintRecord.Service__c = this.maintenances[this.maintenances.length - 1].Service__c;
        } else {
            this.maintRecord.Service__c = null;
        }
        insertMaintenance({ maint: this.maintRecord}).then(() => {
            this.isModalOpen = false;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Maintenance record successfully created',
                    message: 'Maintenance created',
                    variant: 'success',
                })
            );
            return refreshApex(this.maintenances);
        }).catch((err) => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: err.body.message,
                    variant: 'error',
                })
            );
        })
    }
}