({
	doClick : function(component, event, helper) {
        alert(component.isValid());	
        alert(component.getName());		
        alert(component.get('v.Whom'));	
        component.set('v.Whom','Surbhi');
        
        var ageComp = component.find('testInput');
        alert(ageComp.get('v.value'));
        component.set('v.value', 25);
	}
})