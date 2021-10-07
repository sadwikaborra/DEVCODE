({
	fireComponentEvent : function(component, event, helper) {
		var cmpEvent = component.getEvent("cmpEvent");
        cmpEvent.setParams({
            "message": "Component Event Fired"
        });
        cmpEvent.fire();
	}
})