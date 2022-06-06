@isTest
public with sharing class ClassCallTest {
    private static Account cuenta = new Account();
    
    static{
        cuenta.Name= 'Prueba';
        insert cuenta;
    }

    @isTest
    public static void testCallApiCorrect() {
        
        //esto da error de llamada desde test hacia Web Services
            //Boolean response =  ClassCall.CallApi(cuenta.id);
            //SSystem.assert(response, 'la respuesta es falsa');

        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new ApiCalloutMock());

        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        Color colorMio;
        Test.startTest();
        colorMio = ClassCall.CallApi(cuenta.Id);
        Test.stopTest();
        
        System.assert(colorMio.successful, 'El color no fue insertado correctamente.');
        System.assertEquals('random color: #23ABC0', colorMio.color);
        System.assertEquals('#23ABC0', colorMio.colorCode);
        //System.assertEquals('2022-05-26T00:32:59.856Z', colorMio.colorDate);
        System.assertEquals(DateTime.newInstance(2022, 05, 26, 32, 59, 856), colorMio.colorDate);
        System.assertEquals(cuenta.Id, colorMio.accountId);
    }
}