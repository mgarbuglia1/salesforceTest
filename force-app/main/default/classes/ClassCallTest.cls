@isTest
public with sharing class ClassCallTest {
    @isTest
    public static void testCallApiCorrect() {
        Account cuenta = new Account();
        cuenta.Name= 'Prueba';
        insert cuenta;

        //esto da error de llamada desde test hacia Web Services
            //Boolean response =  ClassCall.CallApi(cuenta.id);
            //SSystem.assert(response, 'la respuesta es falsa');

        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ApiCalloutMock());

        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        Color colorMio = new Color();
        colorMio = ClassCall.CallApi(cuenta.id);
        
        System.assert(colorMio.successful, 'El color no fue insertado correctamente.');    
    } 
}