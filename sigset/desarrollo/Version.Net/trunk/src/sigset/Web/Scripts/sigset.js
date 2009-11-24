var xVal = xVal || {};
xVal.Messages = {
    "Required": "Este valor es necesario.",
    "DataType_EmailAddress": "Por favor ingrese una dirección de email valida.",
    "DataType_Integer": "Por favor ingrese un número entero.",
    "DataType_Decimal": "Por favor ingrese un valor numerico.",
    "DataType_Date": "Por favor ingrese una fecha valida.",
    "DataType_DateTime": "Por favor ingrese fecha y hora.",
    "DataType_Currency": "Por favor ingrese una cantidad de dinero.",
    "DataType_CreditCardLuhn": "Por favor ingrese un número de tarjeta de credito valido.",
    "Regex": "Este valor es invalido.",
    "Range_Numeric_Min": "Por favor ingrese un número mayor o igual a {0}.",
    "Range_Numeric_Max": "Por favor ingrese un número menor o igual a {0}.",
    "Range_Numeric_MinMax": "Por favor ingrese un número entre {0} y {1}.",
    "Range_String_Min": "Por favor ingrese un valor no alfabetico antes de '{0}'.",
    "Range_String_Max": "Por favor ingrese un valor no alfabetico antes de '{0}'.",
    "Range_String_MinMax": "Por favor ingrese un texto entre '{0}' y '{1}'.",
    "Range_DateTime_Min": "Por favor ingrese una fecha posterior a {0}.",
    "Range_DateTime_Max": "Por favor ingrese una fecha anterior a {0}.",
    "Range_DateTime_MinMax": "Por favor ingrese una fecha entre {0} y {1}.",
    "StringLength_Min": "Por favor ingrese un minimo de {0} caracteres.",
    "StringLength_Max": "Por favor no ingrese mas de {0} caracteres.",
    "StringLength_MinMax": "Por favor ingrese un texto entre {0} y {1} caracteres.",
    "Comparison_Equals": "Este valor tiene wue ser igual a {0}.",
    "Comparison_DoesNotEqual": "Este valor tiene que ser diferente que {0}."
};


$.validator.addMethod("rut", function(value, element) {
    $("#Rut").val('');
    $("#dv").val('');
    while (value.indexOf(".") != -1) {
        value = value.replace(".", "");
    }
    value = value.toLowerCase(); ;
    var rut = value.split("-");

    if (rut.length > 1) {
        try {
            var T = rut[0];
            var d = rut[1];

            if (T == 0 && T.trim() == "") {
                throw "Error";
            }

            if (d.trim() == "") {
                throw "Error";
            }

            var M = 0, S = 1;
            for (; T; T = Math.floor(T / 10))
                S = (S + T % 10 * (9 - M++ % 6)) % 11;
            var digito = S ? S - 1 : 'k';

            if (digito == d) {
                $("#Rut").val(rut[0]);
                $("#dv").val(rut[1]);
            }
            return this.optional(element) || digito == d;
        }
        catch (err) {
            return this.optional(element) || false;
        }
    }
    else {
        return this.optional(element) || false;
    }
},
	"Ingrese rut valido (ej. 12345678-0)");

$.validator.addMethod("dv", function(value, element) {
    var re = new RegExp(/^[0-9kK]+$/);
    return this.optional(element) || value.match(re);
},"Ingrese digito o letra k");


$(function() {

    //Inicializa Acordion
    $("#accordion").accordion({
        fillSpace: false
    });

    $(".data-table tr").hover(
       function() {
           $(this).addClass("row-highlight");
       },
       function() {
           $(this).removeClass("row-highlight");
       }
    );



    //Funcion para tooltipo
    $("input, buttom, a, select, textarea").tooltip({

        track: true,
        delay: 0,
        showURL: false,
        showBody: " - ",
        fade: 250,
        opacity: 1
    });

    //Funcion para botones
    $(".fg-button:not(.ui-state-disabled)")
		.hover(
			function() {
			    $(this).addClass("ui-state-hover");
			},
			function() {
			    $(this).removeClass("ui-state-hover");
			}
		)
		.mousedown(function() {
		    $(this).parents('.fg-buttonset-single:first').find(".fg-button.ui-state-active").removeClass("ui-state-active");
		    if ($(this).is('.ui-state-active.fg-button-toggleable, .fg-buttonset-multi .ui-state-active')) { $(this).removeClass("ui-state-active"); }
		    else { $(this).addClass("ui-state-active"); }
		})
		.mouseup(function() {
		    if (!$(this).is('.fg-button-toggleable, .fg-buttonset-single .fg-button,  .fg-buttonset-multi .fg-button')) {
		        $(this).removeClass("ui-state-active");
		    }
		});
});


/////////////////////////////////////////
/// Funciones de Adminstrativos
/////////////////////////////////////////

function verDetalles(link, id) {
    var displ = $("#fila" + id).css('display');
    if (displ == "none") {
        $("#fila" + id).show();
    } else {
        $("#fila" + id).hide();
    }

    
    
    
    if ($("#resultado" + id).html().trim() == "") {
        $("#resultado" + id).load(link.href, function() {
            $("#loading" + id).hide();
            $("#resultado" + id).show('normal');
        });
    }
    return false;
}

/////////////////////////////////////////
/// Fin Funciones de Adminstrativos
/////////////////////////////////////////