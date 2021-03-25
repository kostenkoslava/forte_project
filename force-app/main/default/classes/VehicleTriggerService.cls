public class VehicleTriggerService {
    public static final String STATUS_NOT_AVAILABLE = 'Not Available';
    public static final String STATUS_AT_SERVICE = 'At Service';
    public static final String STATUS_AVAILABLE = 'Available';
    public static final String VALIDATE_DATE_ERROR = 'Next maintenance date should be less than last.';
    public static final String STATUS_MESSAGE = 'Currently this vehicle is not available: plate number {0} model {1}';
    
    public static Boolean isStatusAvailable(String newStatus, String oldStatus) {
        if(oldStatus == '' && newStatus != STATUS_AVAILABLE) {
            return false;
        }
        if(oldStatus == STATUS_AVAILABLE && newStatus != STATUS_AVAILABLE) {
            return false;
        }
        return true;
    }
    
    public static void validateNextMaintenanceDate(Vehicle__c vehicleItem) {
        if(vehicleItem.Next_Maintenance_Date__c < vehicleItem.Last_Maintenance_Date__c) {
            vehicleItem.Next_Maintenance_Date__c.addError(VALIDATE_DATE_ERROR);
        }
    }
    
    public static void sendEmailToDrivers(Map<String, String> emailsMap) {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(String email : emailsMap.keySet()) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> toAddresses = new List<String>();
            toAddresses.add(email);
            mail.setToAddresses(toAddresses);
            mail.setSubject('Status changed');
            mail.setPlainTextBody(emailsMap.get(email));
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
    
}

