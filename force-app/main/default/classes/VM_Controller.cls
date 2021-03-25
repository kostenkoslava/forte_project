public with sharing class VM_Controller {
    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getVehicles() {
        return [SELECT Name, Status__c, Plate_Number__c, Model__c, Last_Maintenance_Date__c,
        Next_Maintenance_Date__c FROM Vehicle__c];
    }

    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getVehiclesByStatus(String status) {
        status = status.trim();
        if(status == 'All') {
            return getVehicles();
        }
        return [SELECT Name, Status__c, Plate_Number__c, Model__c, Last_Maintenance_Date__c,
        Next_Maintenance_Date__c FROM Vehicle__c WHERE Status__c =: status];
    }

    @AuraEnabled(cacheable=true)
    public static List<Maintance__c> getRelatedMaintenances(Id vehicleId) {
        return [SELECT Name, Maintenance_start_date__c, Maintenance_due_date__c, Maintenance_Report__c,
        Maintenance_status__c, Service__r.Name FROM Maintance__c WHERE Vehicle__c =: vehicleId ORDER BY Name];
    }

    @AuraEnabled
    public static void insertMaintenance(Maintance__c maint){
        Service__c defaultService = [SELECT Name FROM Service__c WHERE Service__c.Default_Service__c = true LIMIT 1];
        if(maint.Service__c == null) {
            maint.Service__c = defaultService.Id;
        }
        try{  
            insert maint; 
        }catch(Exception e){
            System.debug('--->'+e);
        }
         System.debug('Con '+maint); 
    }   
}
