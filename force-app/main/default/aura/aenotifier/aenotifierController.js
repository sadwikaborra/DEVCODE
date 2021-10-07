({
	fireApplicationEvent : function(cmp, event) {
        
        var appEvent = $A.get("e.c:aeEvent");
        appEvent.setParams({
            "message": "Application event fired"
        });
        appEvent.fire();
		
	}
})