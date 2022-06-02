public with sharing class ParsingJsonDai {
    
@AuraEnabled
     public static Color getColor(String cuentaId) {  

                Http httpProtocol = new Http();
                HttpRequest request = new HttpRequest();
                String endpoint = 'https://apitestjefersonsf2.herokuapp.com/avalian/get-color';
                request.setEndPoint(endpoint);
                request.setMethod('POST');
                request.setBody('{ "accountId" : ' + cuentaId + '}');
                HttpResponse response = httpProtocol.send(request);

                if(response.getStatusCode()== 200){
                     Color colorMio = (Color) JSON.deserialize(response.getBody(), Color.class);
                    colorMio.accountId(cuentaId);
                    colorMio.successful(true);

                    Color__c colorSf = new Color__c();
                    colorSf.colorCode = colorMio.colorCode;
                    colorSf.colorDate = colorMio.colorDate;
                    colorSf.color = colorMio.color;
                    colorSf.accountId = colorMio.accountId;


                  //como se convierte el color a color__c
                    insert colorSf; //del tipo Color__c
                } else {
                      colorMio.successful(false);
                }

      return colorMio;
}
}