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
                //$A.doInit();
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

        var actionMostrar = component.get("c.getLatest");
        var currentRecordId = component.get('v.getRecordId');
        actionMostrar.setParams({ accountId : currentRecordId });

        actionMostrar.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(JSON.parse(JSON.stringify(response.getReturnValue()))); 

                component.set('v.codigo', response.getReturnValue().colorCode__c);


                helper.showToast('Correcto!','New color added!');
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
                helper.showToastEmpty();

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
        $A.enqueueAction(actionMostrar);
	}
}
)
