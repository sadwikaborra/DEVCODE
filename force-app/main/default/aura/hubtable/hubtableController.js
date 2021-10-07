({
	doinit : function(component, event, helper) {
         component.set('v.mycolumns', [
            { label: 'Hub Name', fieldName: 'Name', type: 'text'},
            {
                label: 'Active',
                fieldName: 'Active__c',
                type: 'Checkbox',
            },
            {
                label: 'Location',
                fieldName: 'Location__c',
                type: 'Geolocation',
            },
       
        ]);
		helper.getData(component);
	}
})