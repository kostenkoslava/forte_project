@isTest
public class TestDataFactory {
    public static List<Vehicle__c> createVehiclesWithMaintenances(Integer numVehicles, Integer numMaint) {
        List<Vehicle__c> vehicles = new List<Vehicle__c>();
        Service__c defServ = new Service__c(Name = 'Nike', Default_Service__c = true);
        insert defServ;
        for(Integer i=0; i < numVehicles; i++) {
            Vehicle__c a = new Vehicle__c(Status__c='Available',
                Model__c = 'Mustang', Plate_number__c = 'TX2356',
                Last_Maintenance_Date__c = Date.today(),
                Next_Maintenance_Date__c = (Date.today() + 14));
            vehicles.add(a);
        }
        insert vehicles;
        
        List<Maintance__c> maints = new List<Maintance__c>();
        for (Integer j = 0; j < numVehicles; j++) {
            Vehicle__c vehicle = vehicles[j];
            for (Integer k = 0; k < numMaint; k++) {
                maints.add(new Maintance__c(Vehicle__c=vehicle.Id,
                    Maintenance_start_date__c=(Date.today() + 14),
                    Maintenance_due_date__c=(Date.today() + 28),
                    Maintenance_Report__c='Test Report',
                    Maintenance_status__c='Maintained',
                    Service__c=defServ.Id));
            }
        }
        insert maints;
        
        return vehicles;
    }
}