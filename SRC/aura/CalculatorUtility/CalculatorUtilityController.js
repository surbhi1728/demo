({
	doAdd : function(component, event, helper) {
		var number1 = component.get('v.Input1');
        var number2 = component.get('v.Input2');
        //alert(parseInt(number1) + parseInt(number2));
        component.set('v.Output',parseInt(number1) + parseInt(number2));
	},
    
    doSub : function(component, event, helper) {
		var number1 = component.get('v.Input1');
        var number2 = component.get('v.Input2');
       //alert(parseInt(number1) - parseInt(number2));
       component.set('v.Output',parseInt(number1) - parseInt(number2));
	},
 
    doMul : function(component, event, helper) {
		var number1 = component.get('v.Input1');
        var number2 = component.get('v.Input2');
       //alert(parseInt(number1) * parseInt(number2));
        component.set('v.Output',parseInt(number1) * parseInt(number2));
	},

	doDiv : function(component, event, helper) {
		var number1 = component.get('v.Input1');
        var number2 = component.get('v.Input2');
        //alert(parseInt(number1) / parseInt(number2));
         component.set('v.Output',parseInt(number1) / parseInt(number2));
	}
    
})