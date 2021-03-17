public class VehicleTriggerHandler {
    
    public static void executeAfterInsert(List<Vehicle__c> insertedVehicles) {
        VehicleTriggerHelper.checkStatusAfterInsert(insertedVehicles);
    }
    public static void executeAfterUpdate(Map<Id, Vehicle__c> vehiclesNewMap, Map<Id, Vehicle__c> vehiclesOldMap) {
        VehicleTriggerHelper.checkStatusAfterUpdate(vehiclesNewMap, vehiclesOldMap);
    }
    public static void executeBeforeUpdate(Map<Id, Vehicle__c> vehiclesNewMap, Map<Id, Vehicle__c> vehiclesOldMap) {
        VehicleTriggerHelper.checkNextMaintenanceDateUpdate(vehiclesNewMap, vehiclesOldMap);
    }
    public static void executeBeforeInsert(List<Vehicle__c> insertedVehicles) {
        VehicleTriggerHelper.checkNextMaintenanceDateInsert(insertedVehicles);
    }
}