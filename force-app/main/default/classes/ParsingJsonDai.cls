public with sharing class ParsingJsonDai {
    
            @future(callout=true)
            public static boolean parseJSONResponse() {        
                Http httpProtocol = new Http();
                HttpRequest request = new HttpRequest();
                // Set the endpoint URL.
                String endpoint = 'https://apitestjefersonsf2.herokuapp.com/avalian/get-color';
                request.setEndPoint(endpoint);
                // Set the HTTP verb to POST
                request.setMethod('POST');
                request.setBody('{ "accountId" : "123132" }');
                // Send the HTTP request and get the response.
                // The response is in JSON format.
                HttpResponse response = httpProtocol.send(request);
                System.debug(response.getBody());

                if(response.getStatusCode()== 200){
                    //public static Object deserialize(String jsonString, System.Type apexType)
                     Color__c color = deserialize(response, Color__c);
                     insert color;
                     return true;
                } else {
                    return false;
                }
               
    }
}
