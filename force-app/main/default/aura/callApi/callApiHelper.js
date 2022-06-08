({
    showToast: function(titulo, mensaje, tipo) {
        var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": titulo,
                    "message": mensaje,
                    type: tipo
                });
                toastEvent.fire();
    },

    showToastEmpty: function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Atenttion!",
                "message": "No Colors to Show!",
                type: "info"
            });
            toastEvent.fire();
    }
})
