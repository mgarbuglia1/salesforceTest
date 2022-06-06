({
   
        showToastTrue : function(component, event, helper) {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Success!",
                "message": "The record has been updated successfully."
            });
            toastEvent.fire();
        },   
    
        showToastFalse : function(component, event, helper) {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Error!",
                "message": "The record has NOT been updated successfully."
            });
            toastEvent.fire();
        },   
    
        //se llama este toast desde doInit
        //funciona el toast, falta agregar logica para chequear si hay o no un color
        showToastEmpty : function(component, event, helper) {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "No color to show!",
                "message": "This account doesn't have any colors."
            });
            toastEvent.fire();
        }
    
})