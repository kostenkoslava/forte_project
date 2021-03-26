@isTest
private class VM_Controller_Test {
    @isTest static void TestGetVehiclesByStatus() {
        List<Vehicle__c> insertedRecords = TestDataFactory.createVehiclesWithMaintenances(200, 5);
        
        Test.startTest();
        List<Vehicle__c> testVehiclesWithStatusAvailable = VM_Controller.getVehiclesByStatus('Available');
        List<Vehicle__c> testVehiclesAll = VM_Controller.getVehiclesByStatus('All');
        Test.stopTest();
        System.assertEquals(testVehiclesAll.size(), 200);
        System.assertEquals(insertedRecords.size(), testVehiclesWithStatusAvailable.size());
    }
    @isTest static void TestGetRelatedMaintenance() {
        List<Vehicle__c> insertedRecords = TestDataFactory.createVehiclesWithMaintenances(1, 5);
        Test.startTest();
        List<Vehicle__c> testVehicle = VM_Controller.getVehiclesByStatus('Available');
        List<Maintance__c> maintenances = VM_Controller.getRelatedMaintenances(testVehicle[0].Id);
        Test.stopTest();
        System.assertEquals(maintenances.size(), 5);
    }
}
