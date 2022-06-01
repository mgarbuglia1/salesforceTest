
public with sharing class ParsingJsonDai {
    
@AuraEnabled
     public static boolean getColor(String cuentaId) {  

                Http httpProtocol = new Http();
                HttpRequest request = new HttpRequest();
                String endpoint = 'https://apitestjefersonsf2.herokuapp.com/avalian/get-color';
                request.setEndPoint(endpoint);
                request.setMethod('POST');
                request.setBody('{ "accountId" : ' + cuentaId + '}');
               
                HttpResponse response = httpProtocol.send(request);

                if(response.getStatusCode()== 200){
                     Color__c color = (Color__c) JSON.deserialize(response.getBody(), Color__c.class);
                    
                     insert color;
                     return true;
                } else {
                    return false;
                }

      }

}
