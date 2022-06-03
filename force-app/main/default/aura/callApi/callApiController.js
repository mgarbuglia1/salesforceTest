({
    handleClick : function(component, event, helper) {

        var action = component.get("c.CallApi");
        var currentRecordId = component.get('v.getRecordId');
        action.setParams({ AccountId : currentRecordId });

        action.setCallback(this, function(response) {
            var color = response.getReturnValue();
            if (color.successful === "true") {
                //SUCCESS
                // Alert the user with the value returned from the server
                //aura show toast
                showToastTrue();
            }
            else{
                showToastFalse();
            }
        });

        // $A.enqueueAction adds the server-side action to the queue.
        $A.enqueueAction(action);
    }
},
{
    showToastTrue : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Correcto!",
            "message": "New color added!"
        });
        toastEvent.fire();
    }
},
{
    showToastFalse : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Correcto!",
            "message": "New color added!"
        });
        toastEvent.fire();
    } 
})
