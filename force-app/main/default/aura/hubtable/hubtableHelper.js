({
	getData : function(component,event, helper) {
         var action = component.get('c.fetchHub');
         action.setParams({
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                JSON.stringify('sucess'+response.getReturnValue());
                component.set('v.HubLst', response.getReturnValue());
                
               alert('HubLst'+HubLst);
                console.log(responseValue);
            } 
        });
        $A.enqueueAction(action);
		
	}
})