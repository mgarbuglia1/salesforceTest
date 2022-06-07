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

                     //Insertar fecha que sea en ese momento en vez de adoptar la de la API
                    colorSf.colorDate__c = datetime.now();

                   
                    colorSf.Name = colorMio.color;
                    colorSf.AccountColor__c = colorMio.accountId;

                    insert colorSf; 
                } else {
                      colorMio.setSuccessful(false);
                }

      return colorMio;
}

@AuraEnabled
      public static Color__c getLatest(String cuentaId) {
           
           List<Color__c> colorSf = new List<Color__c>();
            colorSf = [SELECT name, colorDate__c, colorCode__c FROM Color__c WHERE AccountColor__c = :cuentaId ORDER BY colorDate__c LIMIT 1];
           
            System.debug(colorSf.size());
           
            Color__c color1;

            if(colorSf.size()>0){
                 color1 = colorSf.get(0); 
                 System.debug('La fecha del color brindado por la consulta SOQL es: ' + color1.colorDate__c);
                  return color1;
            } else{
                  return null;
            }
           
      }
      

}