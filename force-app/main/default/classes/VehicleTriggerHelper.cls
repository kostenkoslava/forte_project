public class VehicleTriggerHelper {
    public static final String STATUS_NOT_AVAILABLE = 'Not Available';
    public static final String STATUS_AT_SERVICE = 'At Service';
    public static final String STATUS_AVAILABLE = 'Available';
    public static final String VALIDATE_DATE_ERROR = 'Next maintenance date should be less than last.';
    
    public static void checkStatusAfterInsert(List<Vehicle__c> insertedVehicles) {
        List<Vehicle__c> notAvailableStatus = new List<Vehicle__c>();
        Map<String, String> emailsToSent =  new Map<String, String>();
        for(Vehicle__c item : notAvailableStatus) {
            if(item.Status__c == STATUS_AT_SERVICE || item.Status__c == STATUS_NOT_AVAILABLE) {
                emailsToSent.put(item.Driver_Email__c, ('Currently this vehicle is not available - '
                                                        + item.Plate_Number__c + ' ' + item.Model__c));
                notAvailableStatus.add(item);
            }
        }
        sendEmailToDrivers(emailsToSent);
    }
    public static void checkStatusAfterUpdate(Map<Id, Vehicle__c> vehiclesNewMap, Map<Id, Vehicle__c> vehiclesOldMap) {
        List<Vehicle__c> notAvailableStatus = new List<Vehicle__c>();
        Map<String, String> emailsToSent =  new Map<String, String>();
        for(Id vehicleId : vehiclesNewMap.keyset()) {
            Vehicle__c newValue = vehiclesNewMap.get(vehicleId);
            Vehicle__c oldValue = vehiclesOldMap.get(vehicleId);
            if(oldValue.Status__c == STATUS_AVAILABLE) {
                emailsToSent.put(newValue.Driver_Email__c, ('Currently this vehicle is not available - ' 
                                                            + newValue.Plate_Number__c + ' ' + newValue.Model__c));
                notAvailableStatus.add(newValue);
            }
        }
        sendEmailToDrivers(emailsToSent);
    }
    
    public static void checkNextMaintenanceDateInsert(List<Vehicle__c> insertedVehicles) {
        for(Vehicle__c item : insertedVehicles) {
            VehicleTriggerHelper.validateNextMaintenanceDate(item);
        }
    }
    
    public static void checkNextMaintenanceDateUpdate(Map<Id, Vehicle__c> vehiclesNewMap, Map<Id, Vehicle__c> vehiclesOldMap) {
        List<Vehicle__c> changedNextMaintenanceDate = new List<Vehicle__c>();
        for(Id vehicleId : vehiclesNewMap.keyset()) {
            VehicleTriggerHelper.validateNextMaintenanceDate(vehiclesNewMap.get(vehicleId));
            Vehicle__c newValue = vehiclesNewMap.get(vehicleId);
            Vehicle__c oldValue = vehiclesOldMap.get(vehicleId);
            if(oldValue.Next_Maintenance_Date__c != newValue.Next_Maintenance_Date__c) {
                changedNextMaintenanceDate.add(vehiclesNewMap.get(vehicleId));
            }
        }
        if(changedNextMaintenanceDate.size() > 0 ) {
            VehicleTriggerHelper.createNewMaintenanceRecords(changedNextMaintenanceDate);
        }
    }
    
    private static void validateNextMaintenanceDate(Vehicle__c vehicleItem) {
        if(vehicleItem.Next_Maintenance_Date__c < vehicleItem.Last_Maintenance_Date__c) {
            vehicleItem.Next_Maintenance_Date__c.addError(VALIDATE_DATE_ERROR);
        }
    }
    private static void sendEmailToDrivers(Map<String, String> emailsMap) {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(String email : emailsMap.keySet()) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> toAddresses = new List<String>();
            toAddresses.add(email);
            mail.setToAddresses(toAddresses);
            mail.setSubject(STATUS_NOT_AVAILABLE);
            mail.setPlainTextBody(emailsMap.get(email));
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
    private static void createNewMaintenanceRecords(List<Vehicle__c> records) {
        List<Maintance__c> newMaintenances = new List<Maintance__c>();
        Map<String, String> emailsToSent =  new Map<String, String>();
        Service__c defaultService = [SELECT Name FROM Service__c WHERE Service__c.Default_Service__c = true LIMIT 1];
        for(Vehicle__c vehicleItem : records) {
            List<Maintance__c> maint = new List<Maintance__c>();
            Maintance__c temp = new Maintance__c();
            temp.Maintenance_due_date__c = vehicleItem.Next_Maintenance_Date__c + 14;
            temp.Maintenance_start_date__c = vehicleItem.Next_Maintenance_Date__c;
            temp.Vehicle__c = vehicleItem.Id;
            if(vehicleItem.Last_Service__c == null) {
                temp.Service__c = defaultService.Id;
            } else {
                temp.Service__c = vehicleItem.Last_Service__c;
            }
            emailsToSent.put(vehicleItem.Driver_Email__c, ('New maintenance is scheduled for vehicle ' 
                                                           + vehicleItem.Plate_Number__c +  ' from ' +  temp.Maintenance_start_date__c
                                                           +  ' to ' + temp.Maintenance_due_date__c));
            
            newMaintenances.add(temp);
        }
        sendEmailToDrivers(emailsToSent);
        insert newMaintenances;
    }
}