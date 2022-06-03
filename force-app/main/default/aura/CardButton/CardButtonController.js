({
    showToastTrue : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been updated successfully."
        });
        toastEvent.fire();
    }
},   
{
    showToastFalse : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Error!",
            "message": "The record has NOT been updated successfully."
        });
        toastEvent.fire();
    }
},   
    
    {
    handleClick : function(component, event, helper) {

        var action = component.get("c.getColor"); 
        action.setParams( { cuentaId : currentRecordId });

        var currentRecordId =  component.get("v.recordId");

       // ParsingJsonDai.getColor(currentRecordId); //POR QUÉ ESTA SUELTO

        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getReturnValue();
            if (color.successful === "true") {
            
                showToastTrue();
               
                // You would typically fire a event here to trigger 
                // client-side notification that the server-side 
                // action is complete
            }
            else if (state === "false") {
                showToastFalse();
            }
            
        });

    $A.enqueueAction(action);

       
    },
   
})