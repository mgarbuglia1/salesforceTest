({
    handleClick : function(component, event, helper) {

        var action = component.get("c.getColor"); //ver si hay que poner GetColor en mayuscula
        action.setParams( { cuentaId : currentRecordId });

        var currentRecordId =  component.get("v.recordId");

        ParsingJsonDai.getColor(currentRecordId);



 // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // Alert the user with the value returned 
                // from the server
                alert("From server: " + response.getReturnValue());

                // You would typically fire a event here to trigger 
                // client-side notification that the server-side 
                // action is complete
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

     //Toasts start
        if(getColor(currentRecordId)==true){
            LightningUtils.showToast(
                "Success!",
                "The color has been saved successfully",
                {type: "success"}
            );
        } else {
            LightningUtils.showToast(
                "Error!",
                "The color has not been saved.",
                {type: "error"}
            );
        } //Toasts end

       
       
    },
   
})