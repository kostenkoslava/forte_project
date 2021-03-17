trigger VehicleTrigger on Vehicle__c (before delete, before insert, before update, after delete, after insert, after update) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            VehicleTriggerHandler.executeAfterInsert(Trigger.new);
        }
        if(Trigger.isUpdate) {
            VehicleTriggerHandler.executeAfterUpdate(Trigger.newMap, Trigger.oldMap);
        }
    }
    if(Trigger.isBefore) {
        if(Trigger.isUpdate) {
            VehicleTriggerHandler.executeBeforeUpdate(Trigger.newMap, Trigger.oldMap);
        }
        if(Trigger.isInsert) {
            VehicleTriggerHandler.executeBeforeInsert(Trigger.new);
        }
    }
}