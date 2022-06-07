({
  
    handleClick : function(component, event, helper) {


        var action = component.get("c.getColor"); 
        action.setParams( { cuentaId : currentRecordId });

        var currentRecordId =  component.get("v.recordId"); //ubicacion

        action.setCallback(this, function(response) {
            
            var color = response.getReturnValue();
            if (color.successful === "true") {
                
                helper.showToast('Success!', 'The record has been updated successfully :)' );

            } else if (color.successful === "false") {

                helper.showToast('Error.', 'The record has NOT been updated successfully :(');
            }
            
        });

    $A.enqueueAction(action);

    
    },

    doInit: function(component, event, helper) {
        
      
        var action = component.get("c.getLatest");
        var currentRecordId =  component.get("v.recordId"); //Por que esta ubicado asi
        action.setParams( { cuentaId : currentRecordId });
       

        action.setCallback(this, function(response) {
           
            var state = response.getState();
            var color = response.getReturnValue();
          
            if (state === "SUCCESS") {
               
                if(color==null){
                    helper.showToastEmpty();                    
                } else {
                    console.log(JSON.parse(JSON.stringify(response.getReturnValue()))); 
                      component.set('v.codigo', response.getReturnValue().colorCode__c);
                      helper.showToast('Genial!!','Recibimos el color más reciente correctamente!'); 
                }
              
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
             
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            } 
        });

    $A.enqueueAction(action);

    }
})