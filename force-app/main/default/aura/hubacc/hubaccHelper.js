({
                getHubRecord : function( component ) {
                                var action = component.get("c.getHubRecord"); 
        action.setCallback(this, function(response) {
            var state = response.getState(); 
            var result = JSON.stringify(response.getReturnValue());
            if (component.isValid() && state === "SUCCESS")
                component.set("v.hubLst", response.getReturnValue());   
        });
        $A.enqueueAction(action);
                }
})