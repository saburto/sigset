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

	<div id="cliente">
		<form  method="post" action="/orden/crear/" id="formCliente">
		<div id="errorContainer" class="ui-state-error ui-corner-all" style="display:none;">
			<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  id="errorMessage"></span></p>
		</div>
		
		
		
			<label for="clienteParticular" style="display:inline !important;">Cliente Particular</label>
			<input title="Selección de Cliente de tipo particular" type="radio" id="clienteParticular" value="0" checked="checked" name="tipoCliente">
			<label for="clienteComercial" style="display:inline !important;">Cliente Comercial</label>
			<input title="Selección de Cliente de tipo Comercial" type="radio" id="clienteComercial" value="1" name="tipoCliente">
			<div id="formularioParticular">
				<fieldset>
				<div class="tooltip"></div>
				 <legend>Cliente Particular</legend>
				 <div class="three-column-container">
				 	<div class="three-column-left" >
				 		<label>Rut:</label>
					 	<input  type="text" name="rut" title="Rut de Cliente Ej(12345456-9)" class="required" />
				 	</div>
				 	<div class="three-column-left" >
				 		<input title="Buscar Cliente por Rut" type="button" class="button-big" value="Buscar" >
				 	</div>
	 			</div>
	 			<div class="clear" ></div>
			 	<div class="three-column-container">
				 	<div class="three-column-left" >
					 	<label>Nombres:</label>
					 	<input title="Nombres de Cliente" type="text" name="nombre" class="required" />
				 	</div>
				 	<div class="three-column-left" >
					 	<label>Apellido Paterno:</label>
					 	<input type="text" name="apellidoPaterno" class="required" />
				 	</div>
				 	<div class="three-column-rigth" >
					 	<label>Apellido Materno:</label>
					 	<input type="text" name="apellidoMaterno" class="required" />
				 	</div>
			 	</div>
			 	</fieldset>
			</div>
			<div id="formularioComercial" style="display: none;">
				<fieldset>
					<legend>Cliente Comercial:</legend>
				 	<div class="three-column-container">
						<div class="three-column-left" >
					 		<label>Rut:</label>
						 	<input type="text" name="rut" class="required" />
					 	</div>
					 	<div class="three-column-left" >
					 		<input type="button" class="button-big" value="Buscar" >
					 	</div>
				 	</div>
	 			<div class="clear" ></div>
	 			<div class="three-column-container">
				 	<div class="three-column-left" >
						<label for="razonSocial">Razón Social:</label>
						<input type="text" name="razonSocial" class="required" />
					</div>
				</div>
					<div class="three-column-left" >
						<label for="sucursal" >Sucursal:</label>
						<input type="text" name="sucursal" />
					</div>
				</fieldset>
			</div>
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
					<input type="text" name="region" class="required" />
    	        </div>
	    	    <div class="three-column-middle">
					<label for="provincia">Provincia:</label>
					<input type="text" name="provincia" class="required" />
            	</div>
            	<div class="three-column-right">
					<label for="comuna">Comuna:</label>
					<input type="text" name="comuna" class="required" />
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
						<input type="text" name="contactoEmail" />
					</div>
					<div class="three-column-left">
						<label for="rut">Telefono:</label>
						<input type="text" name="contactoTelefono" class="required" />
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
		</form>
	</div>
	<div id="articulo">
	
	</div>
	<div id="orden">
	
	</div>
</div>
<script type="text/javascript" language="javascript">
	InitForm = function () {
		$("#formCliente").validate({
			//errorLabelContainer:$("#errorContainer"),
			invalidHandler: function(e, validator) {
				var errors = validator.numberOfInvalids();
				if (errors) {
					var message = errors == 1
						? 'Hay un campo que no se ha completado correctamente'
						: 'Hay ' + errors + ' campos que no se han completado correctamente.';
					$("#errorMessage").html(message);
					$("#errorContainer").show();
				} else {
					$("#errorContainer").hide();
				}
			}
			
			});
		$("#formularioComercial input").attr("disabled","disabled");
		
	$(":radio[name='tipoCliente']").click(
			function(){
				switch ($(this).val()){
				case "0": {	
					$("#formularioParticular").show();
					$("#formularioComercial").hide();
					$("#formularioParticular input").removeAttr("disabled");
					$("#formularioComercial input").attr("disabled","disabled");
					break;
				}
				case "1":{
					$("#formularioParticular").hide();
					$("#formularioComercial").show();
					$("#formularioComercial input").removeAttr("disabled");
					$("#formularioParticular input").attr("disabled","disabled");
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
		    fade: 250 
	 
	});
};
</script>