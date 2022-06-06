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

                helper.showToast('Correcto!','New color added!');
            }
            else{
                helper.showToast('Error!','Se produjo un error al intentar agregar un color');
            }
        });

        // $A.enqueueAction adds the server-side action to the queue.
        $A.enqueueAction(action);
    },
    
    //evento de inicio
    doInit : function(component, event, helper) {
		//console.log('Aura Component Loaded');
        helper.showToastEmpty();
	}
}
)
