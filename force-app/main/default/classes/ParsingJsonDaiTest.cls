@isTest
public with sharing class ParsingJsonDaiTest {
    
    private static Account cuenta = new Account();

    static {
        cuenta.Name = 'nombre3';
        insert cuenta;
    }


    @isTest
    public static void test1(){

         // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ParsinJsonDaiMock());

        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        Color colorMio;
        Test.startTest();
        colorMio = ParsingJsonDai.getColor(cuenta.Id); 
        Test.stopTest();

       System.assert(colorMio.successful, 'El color no fue guardado correctamente'); 
       
        System.assertEquals('random color: #23ABC0', colorMio.color);
        System.assertEquals('#23ABC0', colorMio.colorCode);
        System.assertEquals('2022-05-26T00:32:59.856Z', colorMio.colorDate); //mal
        System.assertEquals(cuenta.Id, colorMio.getAccountId());


    }
    
}
