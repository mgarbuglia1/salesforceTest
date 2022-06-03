public with sharing class ClassCall {
    @AuraEnabled
    public static Color CallApi(String accountId) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://apitestjefersonsf2.herokuapp.com/avalian/get-color');
        request.setMethod('POST');
        request.setBody('{"accountId" :' + accountId + '}');

        HttpResponse response = http.send(request);

        Color colorMio = new Color();

         //If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            colorMio = (Color) JSON.deserialize(response.getBody(), Color__c.class);
            colorMio.accountId = accountId;
            colorMio.successful = true;

            Color__c ColorSF = new Color__c();
            ColorSF.Name = colorMio.color;
            ColorSF.colorCode__c = colorMio.colorCode;
            ColorSF.colorDate__c = colorMio.colorDate;
             //inserto la relacion del color con la Account
            ColorSF.AccountColor__c = colorMio.accountId;

            insert ColorSF;
        }
        else {
            colorMio.successful = false;
        }
        return colorMio;
    }
}