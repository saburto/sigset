<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div id="tabs">
	<ul>
		<li><a href="#cliente">Cliente</a></li>
		<li><a href="#articulo">Art&iacute;culo</a></li>
		<li><a href="#orden">Datos Orden</a></li>
	</ul>
	<form  method="post" action="/orden/crear/" id="formCliente">
	<div id="cliente">
		
		<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
			<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
		</div>	
		
		
			<label for="clienteParticular" style="display:inline !important;">Cliente Particular</label>
			<input title="Selección de Cliente de tipo particular" type="radio" id="clienteParticular" value="0" checked="checked" name="tipoCliente">
			<label for="clienteComercial" style="display:inline !important;">Cliente Comercial</label>
			<input title="Selección de Cliente de tipo Comercial" type="radio" id="clienteComercial" value="1" name="tipoCliente">
			
				<fieldset>
				<div class="tooltip" style="color: black;!important;"></div>
				 <legend >
				 	<span class="formularioParticular">Cliente Particular</span>
				 	<span class="formularioComercial" style="display: none;">Cliente Comercial</span>
				 </legend>
				 
				 <div class="three-column-container">
				 	<div class="three-column-left" >
				 		<label>Rut:</label>
					 	<input type="text" name="rut" title="Rut de Cliente Ej(12345456-9)" class="required rut" />
				 	</div>
				 	<div class="three-column-left" >
				 		<input title="Buscar Cliente por Rut" type="button" class="button-big" value="Buscar" >
				 	</div>
	 			</div>
	 			<div class="clear" ></div>
			 	<div class="three-column-container formularioParticular">
				 	<div class="three-column-left" >
					 	<label>Nombres:</label>
					 	<input title="Nombres de Cliente" type="text" name="nombre" class="required lettersonly" />
				 	</div>
				 	<div class="three-column-left" >
					 	<label>Apellido Paterno:</label>
					 	<input type="text" name="apellidoPaterno" class="required lettersonly" />
				 	</div>
				 	<div class="three-column-rigth" >
					 	<label>Apellido Materno:</label>
					 	<input type="text" name="apellidoMaterno" class="required lettersonly" />
				 	</div>
			 	</div>
			 	<div class="three-column-container formularioComercial" style="display: none;">
				 	<div class="three-column-left" >
						<label for="razonSocial">Razón Social:</label>
						<input type="text" name="razonSocial" class="required" />
					</div>
				
					<div class="three-column-left" >
						<label for="sucursal" >Sucursal:</label>
						<input type="text" name="sucursal" />
					</div>
				</div>
			 	</fieldset>
	 			<div class="clear" ></div>
			<div>
	        
	        <fieldset>
            <legend>Direcci&oacute;n</legend>
            <div class="three-column-container">
            	<div class="three-column-left">
					<label for="calle">Calle:</label>
					<input type="text" name="calle" class="required" />
				</div>
            	<div class="three-column-middle">
					<label for="numero">Numero:</label>
					<input type="text" name="numero" class="required" />
            	</div>
           	</div>
            <div class="three-column-container">
            	<div class="three-column-left">
					<label for="region">Regi&oacute;n:</label>
					<input id="Region_DISPLAY_TEXT" name="Region_DISPLAY_TEXT" type="text" value="" class="required" />
					<input id="region" name="region" type="hidden" value=""  />
    	        </div>
	    	    <div class="three-column-middle">
					<label for="provincia">Provincia:</label>
					<input id="Provincia_DISPLAY_TEXT" name="Provincia_DISPLAY_TEXT" type="text" value="" class="required" />
					<input id="provincia" name="provincia" type="hidden" value=""  />
					
            	</div>
            	<div class="three-column-right">
					<label for="comuna">Comuna:</label>
					<input id="Comuna_DISPLAY_TEXT" name="Comuna_DISPLAY_TEXT" type="text" value="" class="required" />
					<input id="comuna" name="comuna" type="hidden" value=""   />
					
            	</div>
            </div>
        	</fieldset>
			</div>
			<div>
				<fieldset>
					<legend>Contacto</legend>
					<div class="three-column-container">
					<div class="three-column-left">
						<label for="rut">Email:</label>
						<input type="text" name="contactoEmail" class="email" />
					</div>
					<div class="three-column-left">
						<label for="rut">Telefono:</label>
						<input type="text" name="contactoTelefono" class="required digits"  />
					</div>
					</div>
				</fieldset>
			</div>
			
			<fieldset>
				<legend>Observaci&oacute;n</legend>
				<textarea style="width: 100%;%" rows="6" name="observacion"></textarea>
				<div class="clear" ></div>
			</fieldset>
			<div style="text-align: right;">
				<fieldset>
					<input type="submit" class="button-big" value="Siguiente"></input>
				</fieldset>
			</div>
		
	</div>
	<div id="articulo">
		<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
		</div>
	<fieldset>
            <legend>Nuevo Articulo</legend>
            <div class="three-column-container">
                <div class="three-column-left">
	                <label for="modelo">Modelo:</label>
	                <input type="text" name="modelo" class="required" />
                </div>
                <div class="three-column-middle">
                	<label for="marca">Marca:</label>
                	<input type="text" name="marca" class="required" />
                </div>
                <div class="three-column-right">
	                <label for="linea">Linea:</label>
	                <input type="text" name="linea" class="required" />
                </div>
            </div>
            <br />
            <br />
            <div class="three-column-container">
                <div class="three-column-left">
                	<label for="categoria">Categoria:</label>
                	<input type="text" name="categoria" class="required" />
                </div>
                
                <div class="three-column-middle">
    	            <label for="tipo_Articulo">Tipo Articulo:</label>
	                <input type="text" name="tipo_Articulo" class="required" />
                </div>
                
                <div class="three-column-right">
	                <label for="precio_Garantia">Precios Garantia:</label>
	                <input type="text" name="precio_Garantia" class="required" />
                </div>
            </div>
                <div class="clear"></div>
        </fieldset>
        <fieldset>
					<div style="text-align: left;float: left;">
						<input type="button" class="button-big" value="Anterior" />
					</div>
					<div style="text-align: right;float: right;">
						<input type="submit" class="button-big" value="Siguiente" />
					</div>
		</fieldset>
	</div>
	<div id="orden">
		<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
		</div>
		
        <fieldset>
            <legend>Orden de Trabajo</legend>
            <p>
                <label for="serie">N° Serie de Articulo:</label>
                <input type="text" name="serie" class="required" />
            </p>

            <p>
                <label for="falla">Falla Articulo:</label>
                <textarea style="width: 100%;%" rows="6" name="falla"></textarea>
            </p>
            <p>
                <label for="Condicion Articulo">Condicion Articulo:</label>
                <textarea style="width: 100%;%" rows="6" name="condicionArticulo"></textarea>
            </p>

            <div class="three-column-container">
                <div class="three-column-left">
                <p>
                    <label for="Tipo_Orden">Tipo Orden:</label>
                    <label for="tipoGarantia" style="display:inline !important;" >Garantia:</label>
                    <input type="radio" id="tipoGarantia" name="tipoOrden" value="1">
                    <br />
                    <label for="tipoParticular" style="display:inline !important;" >Particular:</label>
                    <input type="radio" id="tipoParticular" name="tipoOrden" value="2">
                    
                </p>
                </div>
                <div id="datosGarantia">
                <div class="three-column-middle">
                <p>
                <label for="boleta">Boleta:</label>
                <input type="text" name="boleta" />
                <label for="poliza">Poliza:</label>
                <input type="text" name="poliza" />
                </p>
                </div>
                <div class="three-column-right">
                <p>
                <label for="Fecha_Compra">Fecha Compra:</label>
                <input type="text" name="fechaCompra" id="fechaCompra" />
                <label for="Lugar_Compra">Lugar Compra:</label>
                <input type="text" name="lugarCompra" />
                </p>
                </div>
                </div>
            </div>
            <div class="clear"></div>
            <p>
                <label for="Fecha Entrega">Fecha Entrega:</label>
                <input type="text" name="fechaEntrega" id="fechaEntrega"  />
            </p>
        </fieldset>
        <fieldset>
					<div style="text-align: left;float: left;">
						<input type="button" class="button-big" value="Anterior" />
					</div>
					<div style="text-align: right;float: right;">
						<input type="submit" class="button-big" value="Guardar" />
					</div>
        </fieldset>
	</div>
	</form>
</div>
<script type="text/javascript" language="javascript">
	InitForm = function () 
	{
		//TODO: Descomentar esto
		//$('#tabs').tabs('option', 'disabled', [1, 2]);
		//$("#articulo input").attr("disabled","disabled");
		//$("#orden input").attr("disabled","disabled");
		
		$("#formCliente").validate({
			invalidHandler: function(e, validator) {
				var errors = validator.numberOfInvalids();
				if (errors) {
					var message = errors == 1
						? 'Hay un campo que no se ha completado correctamente'
						: 'Hay ' + errors + ' campos que no se han completado correctamente.';
					$(".errorMessage").html(message);
					$(".errorContainer").show();
				} else {
					$(".errorContainer").hide();
				}
			},
			submitHandler:function(form){
				//$('#tabs').tabs('option', 'disabled', [1, 2]);
				$('#tabs').tabs( 'enable' , 1);
				$('#tabs').tabs( 'select' , 1 );
				$("#articulo input").removeAttr("disabled");
				$.scrollTo("articulo");				 
			}
			
			});

		
		$(".formularioComercial input").attr("disabled","disabled");
		
	$(":radio[name='tipoCliente']").click(
			function(){
				switch ($(this).val()){
				case "0": {	
					$(".formularioParticular").show();
					$(".formularioComercial").hide();
					$(".formularioParticular input").removeAttr("disabled");
					$(".formularioComercial input").attr("disabled","disabled");
					break;
				}
				case "1":{
					$(".formularioParticular").hide();
					$(".formularioComercial").show();
					$(".formularioComercial input").removeAttr("disabled");
					$(".formularioParticular input").attr("disabled","disabled");
					break;
				}
				}
			}
			);
	$("#formCliente input").tooltip({ 
		 
		    track: true, 
		    delay: 0, 
		    showURL: false, 
		    showBody: " - ", 
		    fade: 250,
		    opacity:1
		    //extraClass:"tooltip"
	 
	});

    $('#fechaCompra').datepicker();
    $('#fechaEntrega').datepicker();
    
    $('input:[name=tipoOrden]').click(
        function()
        {
          if($(this).val() == 2)
          {
            $('#datosGarantia').hide();
            
			$("#datosGarantia input").attr("disabled","disabled");
          }
          else
          {
       	  	$("#datosGarantia input").removeAttr("disabled");
            $('#datosGarantia').show();
          }  
        }
    );

    $('#Region_DISPLAY_TEXT').autocomplete('/util/encontrarRegiones', {
    	mustMatch: true, selectFirst:true,
    	 
    	            autoFill: false,
    	            max: 15,
    	            cacheLength:0,
    	            delay:100,
    	            minChars:0,
    	            dataType:'json',
    	            parse: function(data)
    	            {
    	                var array = new Array();
    	                for(var i=0;i<data.length;i++) 
    	                {
    	                    array[i] = { data:data[i], value: data[i].value, result: data[i].display};
    	                }
    	                return array;
    	            },
    	            formatItem: function(data,i,max,value,term) {
    				return data.display;}
    	   });
    	 
    	   $('#Region_DISPLAY_TEXT').result(function(e, d, f) {
    	       $('#region').val(d.value);
    	    });
    	 
    	 
    	    
    	 $('#Provincia_DISPLAY_TEXT').autocomplete('/util/encontrarProvincias', {
    	mustMatch: true, selectFirst:true,
    	 
    	            autoFill: false,
    	            max: 30,
    	            cacheLength:0,
    	            delay:100,
    	            minChars:0,
    	            dataType:'json',
    	            parse: function(data)
    	            {
    	                var array = new Array();
    	                for(var i=0;i<data.length;i++) 
    	                {
    	                    array[i] = { data:data[i], value: data[i].value, result: data[i].display};
    	                }
    	                return array;
    	            },
    	            formatItem: function(data,i,max,value,term) {
    				return data.display;}
    	, extraParams : { Region:function(){return $('#region').val();}}
    	   });
    	 
    	   $('#Provincia_DISPLAY_TEXT').result(function(e, d, f) {
    	       $('#provincia').val(d.value);
    	    });
    	 
    	 
    	    
    	 $('#Comuna_DISPLAY_TEXT').autocomplete('/util/encontrarComunas', {
    	mustMatch: true, selectFirst:true,
    	 
    	            autoFill: false,
    	            max: 100,
    	            cacheLength:0,
    	            delay:100,
    	            minChars:0,
    	            dataType:'json',
    	            parse: function(data)
    	            {
    	                var array = new Array();
    	                for(var i=0;i<data.length;i++) 
    	                {
    	                    array[i] = { data:data[i], value: data[i].value, result: data[i].display};
    	                }
    	                return array;
    	            },
    	            formatItem: function(data,i,max,value,term) {
    				return data.display;}
    	, extraParams : { Provincia:function(){return $('#provincia').val();}}
    	   });
    	 
    	   $('#Comuna_DISPLAY_TEXT').result(function(e, d, f) {
    	       $('#comuna').val(d.value);
    	    });
    	    
};
</script>