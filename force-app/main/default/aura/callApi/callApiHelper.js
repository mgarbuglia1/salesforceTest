({
    showToast: function(titulo, mensaje, tipo) {
        var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": titulo,
                    "message": mensaje
                });
                toastEvent.fire();
    },

    showToastEmpty: function(titulo, mensaje, tipo) {
        var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Atenttion!",
                "message": "No Colors to Show!"
            });
            toastEvent.fire();
    }
})
