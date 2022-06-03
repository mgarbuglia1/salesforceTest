public with sharing class ParsingJsonDai {
    
@AuraEnabled
     public static Color getColor(String cuentaId) {  

                Http httpProtocol = new Http();
                HttpRequest request = new HttpRequest();
                String endpoint = 'https://apitestjefersonsf2.herokuapp.com/avalian/get-color';
                request.setEndPoint(endpoint);
                request.setMethod('POST');
                request.setBody('{ "accountId" : ' + cuentaId + '}');
                HttpResponse res = httpProtocol.send(request);

                Color colorMio = new Color();

                if(res.getStatusCode()== 200){
                    
                    colorMio = (Color) JSON.deserialize(res.getBody(), Color.class);
                    colorMio.setAccountId(cuentaId);
                    colorMio.setSuccessful(true); 

                    Color__c colorSf = new Color__c();
                    colorSf.colorCode__c = colorMio.colorCode;
                    colorSf.colorDate__c = colorMio.colorDate;
                    colorSf.Name = colorMio.color;
                    colorSf.AccountColor__c = colorMio.accountId;

                    insert colorSf; 
                } else {
                      colorMio.setSuccessful(false);
                }

      return colorMio;
}
}