@isTest
public with sharing class ParsingJsonDaiTest {
    
    private static Account cuenta = new Account();

    static {
        cuenta.Name = 'nombre';
        insert cuenta;
    }

    // almacenar colores en "cuenta"
    //GETLATEST SOLO NECESITA COLORES DEL TIPO Color__c
    private static Color__c unColor = new Color__c();

    static {
        //ingresar valores e insertar color
        //recordar valor cuenta.Id!
       unColor.colorCode__c = '#123423';
       unColor.colorDate__c = datetime.now(); //console.debug para obtenerlo
       unColor.Name = 'Color1';
       unColor.AccountColor__c = cuenta.Id;
       insert unColor;
    }

    @isTest
    public static void test1(){

        Test.setMock(HttpCalloutMock.class, new ParsinJsonDaiMock());

        Color colorMio;
        Test.startTest();
        colorMio = ParsingJsonDai.getColor(cuenta.Id); 
        Test.stopTest();

        System.assert(colorMio.successful, 'El color no fue guardado correctamente'); 
        System.assert(colorMio.colorDate != null); 

        System.assertEquals('random color: #23ABC0', colorMio.color);
        System.assertEquals('#23ABC0', colorMio.colorCode);
        System.assertEquals(cuenta.Id, colorMio.getAccountId());
    }
    
@isTest
    public static void test2(){

        Color__c latestColor;

        Test.startTest();
        latestColor = ParsingJsonDai.getLatest(cuenta.Id);
        Test.stopTest();

        System.assert(latestColor != null); 
    }

}
