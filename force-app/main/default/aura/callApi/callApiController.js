({
    handleClick : function(component, event, helper) {

        var action = component.get("c.CallApi");
        var currentRecordId = component.get("v.recordId");
        action.setParams({ accountId : currentRecordId });

        console.log('Esta es la cuenta idddddddd:' + currentRecordId);

        action.setCallback(this, function(response) {
            var state = response.getState();

            if(state === "SUCCESS") {
                var color = response.getReturnValue();
                console.log(JSON.parse(JSON.stringify(color)));

                if (color.successful == true) {
                    helper.showToast('Correcto!','New color added!', 'success');
                    component.set('v.codigo', response.getReturnValue().colorCode);
                    //console.log(component.get('v.codigo'));
                }
                else{
                    helper.showToast('Error!','Se produjo un error al intentar agregar un color.', 'warning');
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
                                errors[0].message + color);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

        // $A.enqueueAction adds the server-side action to the queue.
        $A.enqueueAction(action);
    },
    
    //evento de inicio
    doInit : function(component, event, helper) {

        var action = component.get("c.getLatest");
        var currentRecordId = component.get("v.recordId");
        action.setParams({ accountId : currentRecordId });

        action.setCallback(this, function(response) {
            //console.log(JSON.parse(JSON.stringify(response.getReturnValue())));

            var respuesta = response.getReturnValue();
            var state = response.getState();

            if(state === "SUCCESS") {
                if(respuesta == null){
                    //console.log(response.getReturnValue().colorCode__c);
                    helper.showToastEmpty();
                }else{
                    component.set('v.codigo', response.getReturnValue().colorCode__c);
                }                
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
                
                /*var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }*/
            } 
        });
        $A.enqueueAction(action);
	}
}
)
