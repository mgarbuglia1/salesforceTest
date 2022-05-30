({
    handleClick : function(component, event, helper) {
        if(ClassCall()==true){
            LightningUtils.showToast(
                "Correcto",
                "New color added!",
                {type: "success"}
            );
        }
        else
        {
            LightningUtils.showToast(
                "Error",
                "No color to Show!",
                {type: "error"}
            );
        }
    }
})
