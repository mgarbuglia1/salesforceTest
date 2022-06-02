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
        HttpResponse res = ParsingJsonDai.getColor(cuenta.Id); //no entiendo porqe llama a la clase y no al mock




      //  Color__c response = ParsingJsonDai.getColor(cuenta.Id);
      //  System.assert(response, 'La respuesta está mal');

    }
    
}
