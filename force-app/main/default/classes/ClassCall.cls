public with sharing class ClassCall {
    public static boolean ClassCall() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://apitestjefersonsf2.herokuapp.com/avalian/get-color');
        request.setMethod('POST');
        request.setBody('{"accountId" : "123132" }');

        HttpResponse response = http.send(request);

         //If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            Color__c color = deserialize(response, Color__c);
            insert color;

            return true;
        }
        else {
           return false; 
        }

    }
}
