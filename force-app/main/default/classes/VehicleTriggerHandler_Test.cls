@isTest
public class VehicleTriggerHandler_Test {
    @TestSetup
    static void makeData() {
        List <Vehicle__c> vehicles = new List<Vehicle__c>();
        Contact driver = new Contact(LastName = 'Slava', Email = 'shegan782@gmail.com');
        Service__c defServ = new Service__c(Name = 'Nike', Default_Service__c = true);
        insert driver;
        insert defServ;
        for(Integer i = 0; i < 150; ++i) {
            vehicles.add(new Vehicle__c(Driver__c = driver.Id, Model__c = 'Mustang', Plate_number__c = 'TX2356',
                                        Last_Maintenance_Date__c = Date.today(),
                                        Next_Maintenance_Date__c = (Date.today() + 14)));
        }
        insert vehicles;
    }
    @isTest
    static void checkNewMaintanences() {
        List<Vehicle__c> testVehicles = [Select Next_Maintenance_Date__c From Vehicle__c Where Model__c = 'Mustang'];
        for(Vehicle__c vh : testVehicles) {
            vh.Next_Maintenance_Date__c = Date.today() + 3;
        }
        Test.startTest();
        update testVehicles;
        Test.stopTest();
        
        Vehicle__c updtVehicle = [Select Name, Next_Maintenance_Date__c From Vehicle__c Where Model__c = 'Mustang' Limit 1];
        Maintance__c testMaint = [Select Maintenance_due_date__c,
                                               Maintenance_start_date__c, Scheduled_maintenance_date__c,
                                               Service__c From Maintance__c Where Vehicle__r.Id =: updtVehicle.Id  Limit 1];
        System.assertEquals(updtVehicle.Next_Maintenance_Date__c + 14, testMaint.Maintenance_due_date__c);
        System.assertEquals(updtVehicle.Next_Maintenance_Date__c, testMaint.Maintenance_start_date__c);
        
    }
}