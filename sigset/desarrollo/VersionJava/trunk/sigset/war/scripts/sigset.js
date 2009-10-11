$(document).ready(function() {

$.validator.addMethod("rut", function(value, element) {

		while( value.indexOf(".") != -1 ){
    		value = value.replace(".","");
    	}
		value = value.toLowerCase();;
    	var rut = value.split("-");
		var T = rut[0];
		var d = rut[1];
		
		var M=0,S=1;
		for(;T;T=Math.floor(T/10))
			S=(S+T%10*(9-M++%6))%11;
		var digito = S?S-1:'k';
		 
		 return this.optional(element) || digito == d; 
	}, 
	"Ingrese rut valido (ej. 12345678-0)");
	
$.datepicker.setDefaults({
    constrainInput: true,
    dateFormat: 'dd-mm-yy',
	closeText: 'Cerrar',
	prevText: '&#x3c;Ant',
	nextText: 'Sig&#x3e;',
	currentText: 'Hoy',
	monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
	'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
	monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
	'Jul','Ago','Sep','Oct','Nov','Dic'],
	dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
	dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
	dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
    firstDay: 1,
	isRTL: false,
	showButtonPanel: true
});

$.Autocompleter.defaults = {
		inputClass: "ac_input",
		resultsClass: "ac_results",
		loadingClass: "ac_loading",
		minChars: 0,
		dataType:'json',
		delay: 200,
		matchCase: false,
		matchSubset: true,
		matchContains: false,
		cacheLength: 0,
		max: 100,
		mustMatch: false,
		extraParams: {},
		selectFirst: true,
		formatItem: function(data,i,max,value,term) {
			return data.display;},
		formatMatch: null,
		parse: function(data){
		    var array = new Array();
		    for(var i=0;i<data.length;i++) 
		    {
		        array[i] = { data:data[i], value: data[i].value, result: data[i].display};
		    }
		    return array;
		},
		autoFill: false,
		width: 0,
		multiple: false,
		multipleSeparator: ", ",
		highlight: function(value, term) {
			return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
		},
	    scroll: true,
	    scrollHeight: 180};
});