public class VehicleTriggerHandler {
    public static void executeBeforeUpdate(Map<Id, Vehicle__c> vehiclesNewMap, Map<Id, Vehicle__c> vehiclesOldMap) {
        VehicleTriggerHelper.initDataForMaintenanceProcess(vehiclesNewMap, vehiclesOldMap);
    }
    public static void executeBeforeInsert(List<Vehicle__c> insertedVehicles) {
        VehicleTriggerHelper.checkNextMaintenanceDateInsert(insertedVehicles);
    }
    public static void executeAfterInsert(List<Vehicle__c> insertedVehicles) {
        VehicleTriggerHelper.checkStatusAfterInsert(insertedVehicles);
    }
    public static void executeAfterUpdate(Map<Id, Vehicle__c> vehiclesNewMap, Map<Id, Vehicle__c> vehiclesOldMap) {
        VehicleTriggerHelper.checkStatusAfterUpdate(vehiclesNewMap, vehiclesOldMap);
        VehicleTriggerHelper.updateMaintenanceProcess();
        VehicleTriggerHelper.assignMaintenance();
    }
} 
