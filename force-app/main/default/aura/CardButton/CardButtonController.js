({
  
    handleClick : function(component, event, helper) {

        var action = component.get("c.getColor"); 
        action.setParams( { cuentaId : currentRecordId });

        var currentRecordId =  component.get("v.recordId");

        action.setCallback(this, function(response) {
            var color = response.getReturnValue();
            if (color.successful === "true") {
                
                helper.showToastTrue();

             // $A.doInit(); //PREGUNTAR

               
            } else if (color.successful === "false") {

                helper.showToastFalse();
            }
            
        });

    $A.enqueueAction(action);

    
    },

    doInit: function(component, event, helper) {
        
        var action = component.get("c.getLatest"); 
        action.setParams( { cuentaId : currentRecordId });

        var currentRecordId =  component.get("v.recordId");

        action.setCallback(this, function(response) {
            var colorL = response.getReturnValue();

            if(colorL===null){

                helper.showToastEmpty();

            } else {

             var colorCode = colorL.colorCode;
             var colorName = colorL.colorName;
            
            //enviar colorCode al atributo codigo del componente
            }            
        });

    $A.enqueueAction(action);

    }
})