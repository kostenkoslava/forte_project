public class VehicleTriggerHelper {
    private static List<Vehicle__c> dateChangedVehicles;
    private static List<Maintance__c> newMaintenances;
    public static void checkStatusAfterInsert(List<Vehicle__c> insertedVehicles) {
        Map<String, String> emailsToSent =  new Map<String, String>();
        for(Vehicle__c item : insertedVehicles) {
            if(!VehicleTriggerService.isStatusAvailable(item.Status__c, '')) {
                emailsToSent.put(item.Driver_Email__c, (String.format(VehicleTriggerService.STATUS_MESSAGE,
                                                                      new List<Object> { item.Plate_Number__c, item.Model__c})));
            }
        }
        VehicleTriggerService.sendEmailToDrivers(emailsToSent);
    }
    public static void checkStatusAfterUpdate(Map<Id, Vehicle__c> vehiclesNewMap, Map<Id, Vehicle__c> vehiclesOldMap) {
        Map<String, String> emailsToSent =  new Map<String, String>();
        for(Id vehicleId : vehiclesNewMap.keyset()) {
            Vehicle__c newValue = vehiclesNewMap.get(vehicleId);
            Vehicle__c oldValue = vehiclesOldMap.get(vehicleId);
            if(!VehicleTriggerService.isStatusAvailable(newValue.Status__c, oldValue.Status__c)) {
                emailsToSent.put(newValue.Driver_Email__c,
                                 (String.format(VehicleTriggerService.STATUS_MESSAGE,
                                                new List<Object> { newValue.Plate_Number__c, newValue.Model__c})));
            }
        }
        
        VehicleTriggerService.sendEmailToDrivers(emailsToSent);
    }
    
    public static void initDataForMaintenanceProcess (Map<Id, Vehicle__c> vehiclesNewMap, Map<Id, Vehicle__c> vehiclesOldMap) {
        dateChangedVehicles = new List<Vehicle__c>();
        newMaintenances = new List<Maintance__c>();
        for(Id vehicleId : vehiclesNewMap.keyset()) {
            Vehicle__c newValue = vehiclesNewMap.get(vehicleId);
            Vehicle__c oldValue = vehiclesOldMap.get(vehicleId);
            VehicleTriggerService.validateNextMaintenanceDate(newValue);
            if(oldValue.Next_Maintenance_Date__c != newValue.Next_Maintenance_Date__c) {
                dateChangedVehicles.add(newValue);
            }
        }
    }
    
    public static void checkNextMaintenanceDateInsert(List<Vehicle__c> insertedVehicles) {
        for(Vehicle__c item : insertedVehicles) {
            VehicleTriggerService.validateNextMaintenanceDate(item);
        }
    }
    
    public static void updateMaintenanceProcess() {
        Service__c defaultService = [SELECT Name FROM Service__c WHERE Service__c.Default_Service__c = true LIMIT 1];
        Map<String, String> emailsToSent =  new Map<String, String>();
        List<Vehicle__c> targetVehicles = [
            SELECT
            Id,
            Driver_Email__c,
            Next_Maintenance_Date__c,
            Last_Maintenance__r.Service__c,
            Last_Service__c,
            Plate_Number__c
            FROM Vehicle__c
            WHERE Id IN :dateChangedVehicles
            WITH SECURITY_ENFORCED
        ];
        for(Vehicle__c vehicleItem : targetVehicles) {
            Maintance__c temp = new Maintance__c();
            temp.Maintenance_due_date__c = vehicleItem.Next_Maintenance_Date__c + 14;
            temp.Maintenance_start_date__c = vehicleItem.Next_Maintenance_Date__c;
            temp.Vehicle__c = vehicleItem.Id;
            if(vehicleItem.Last_Maintenance__c == null) {
                temp.Service__c = defaultService.Id;
            } else {
                temp.Service__c = vehicleItem.Last_Maintenance__r.Service__c;
            }
            emailsToSent.put(vehicleItem.Driver_Email__c, ('New maintenance is scheduled for vehicle ' 
                                                           + vehicleItem.Plate_Number__c +  ' from ' +  temp.Maintenance_start_date__c
                                                           +  ' to ' + temp.Maintenance_due_date__c));
            
            newMaintenances.add(temp);
        }
        VehicleTriggerService.sendEmailToDrivers(emailsToSent);
        insert newMaintenances;
    }
    
    public static void assignMaintenance() {
        for (Vehicle__c vehicle : dateChangedVehicles) {
            for (Maintance__c maintenance : newMaintenances) {
                if (maintenance.Vehicle__c == vehicle.Id) {
                    vehicle.Last_Maintenance__c = maintenance.Id;
                }
            }
        }
    }
}