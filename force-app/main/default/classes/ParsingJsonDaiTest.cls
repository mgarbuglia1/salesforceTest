@isTest
public with sharing class ParsingJsonDaiTest {
    
    @isTest
    public static void test1(){

         // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ParsinJsonDaiMock());

        Account cuenta = new Account();
        cuenta.Name = 'nombre';
        insert cuenta;
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        Color colorMio = new Color();
        colorMio = ParsingJsonDai.getColor(cuenta.Id); 




      //  Color__c response = ParsingJsonDai.getColor(cuenta.Id);
      //  System.assert(response, 'La respuesta está mal');

    }
    
}
