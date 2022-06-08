public with sharing class ClassCall {

    @AuraEnabled
    public static Color CallApi(String accountId) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://apitestjefersonsf2.herokuapp.com/avalian/get-color');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody('{ "accountId" : "' + accountId + '"}');

        HttpResponse response = http.send(request);
        Color colorMio;

         //If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            //mensaje= 'entró por el 200';
            colorMio = (Color) JSON.deserialize(response.getBody(), Color.class);

            colorMio.accountId = accountId;
            colorMio.successful = true;

            System.debug(colorMio);

            Color__c ColorSF = new Color__c();
            ColorSF.Name = colorMio.color;
            ColorSF.colorCode__c = colorMio.colorCode;
            ColorSF.colorDate__c = colorMio.colorDate;
            //inserto la relacion del color con la Account
            ColorSF.AccountColor__c = colorMio.accountId;

            System.debug(ColorSF);

            insert ColorSF;
        }
        else {
            colorMio.successful = false;
        }
        return colorMio;
    }

    @AuraEnabled
    public static Color__c getLatest(String accountId) {
        List<Color__c> result = [SELECT Name, colorCode__c, colorDate__c FROM Color__c WHERE AccountColor__c =:accountId ORDER BY colorDate__c DESC LIMIT 1];

        Color__c colorRetorno;

        if(result.size() > 0){
            colorRetorno = result.get(0);
            return colorRetorno;
        }else{
            return null;
        }
    }
}