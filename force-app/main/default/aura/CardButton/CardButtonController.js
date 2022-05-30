({
    handleClick : function(component, event, helper) {
        if(parseJSONResponse()==true){

            LightningUtils.showToast(
                "Success!",
                "The color has been saved successfully",
                {type: "success"}
            );


        } // if true ends 
        else {

            LightningUtils.showToast(
                "Error!",
                "The color has not been saved.",
                {type: "error"}
            );



        } //else ends
    }
})