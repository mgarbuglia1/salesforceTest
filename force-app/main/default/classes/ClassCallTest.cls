@isTest
public with sharing class ClassCallTest {
    private static Account cuenta = new Account();
    
    static{
        cuenta.Name= 'Prueba';
        insert cuenta;
    }

    static {
        //ingresar valores e insertar color
        //recordar valor cuenta.Id!
       unColor.colorCode__c = '#123423';
       unColor.colorDate__c = datetime.now();
       unColor.Name = 'Color1';
       unColor.AccountColor__c = cuenta.Id;
       insert unColor;
    }

    @isTest
    public static void testCallApiCorrect() {
        List<Color__c> newColors = [SELECT Id FROM Color__c];
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

        System.assertEquals(1, newColors.size());
        
        System.assert(colorMio.successful, 'El color no fue insertado correctamente.');
        System.assertEquals('random color: #23ABC0', colorMio.color);
        System.assertEquals('#23ABC0', colorMio.colorCode);
        //System.assertEquals('2022-05-26T00:32:59.856Z', colorMio.colorDate);
        //System.assertEquals(DateTime.newInstance(2022, 05, 26, 32, 59, 856), colorMio.colorDate);
        System.assertEquals(cuenta.Id, colorMio.accountId);
    }

    @isTest
    public static void testGetLatest() {
        private static Color__c unColor = new Color__c();

        Color__c colorPrueba;
        Test.startTest();
        colorPrueba = ClassCall.getLatest(cuenta.Id);
        Test.stopTest();

        System.assert(colorPrueba != null);
    }
}