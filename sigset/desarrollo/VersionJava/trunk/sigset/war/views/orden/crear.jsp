<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div id="tabs">
	<ul>
		<li><a href="#cliente">Cliente</a></li>
		<li><a href="#articulo">Articulo</a></li>
		<li><a href="#orden">Orden</a></li>
	</ul>

	<div id="cliente">
		<form  method="post" action="/orden/crear/">
			<div class="three-column-container">
				<div class="three-column-left">
					<label for="clienteParticular" style="display:inline !important;">Cliente Particular</label>
					<input type="radio" id="clienteParticular" value="0" checked="checked" name="tipoCliente">
					<label for="clienteComercial" style="display:inline !important;">Cliente Comercial</label>
					<input type="radio" id="clienteComercial" value="1" name="tipoCliente">
					
				</div>
				<div class="three-column-left">
				</div>
				<div class="clear" ></div>
			</div>
			
			<div id="formularioParticular">
				<fieldset>
				 <legend>Cliente Particular</legend>
				 	<label>Rut:</label>
				 	<input type="text" name="rut" />
				 	<label>Nombre:</label>
				 	<input type="text" name="nombre" />
				 	<label>Apellido Paterno:</label>
				 	<input type="text" name="apellidoPaterno" />
				 	<label>Apellido Materno:</label>
				 	<input type="text" name="apellidoMaterno" />
			 	</fieldset>
			</div>
			<div id="formularioComercial" style="display: none;">
				<fieldset>
					<legend>Cliente Comercial:</legend>
					<label>Rut:</label>
					<input type="text" name="rut" />
					<label>Razón Social:</label>
					<input type="text" name="razonSocial" />
					<label>Sucursal:</label>
					<input type="text" name="sucursal" />
				</fieldset>
			</div>
			
			
			
			<label for="observacion">Observaciones</label>
			<textarea name="observacion"></textarea>
			<input type="submit" value="enviar"></input>
		</form>
	</div>
	<div id="articulo">
	
	</div>
	<div id="orden">
	
	</div>
</div>
<script type="text/javascript" language="javascript">
	InitForm = function () {
	$(":radio[name='tipoCliente']").click(
			function(){
				switch ($(this).val()){
				case "0": {	
					$("#formularioParticular").show();
					$("#formularioComercial").hide();
					
					break;
				}
				case "1":{
					$("#formularioParticular").hide();
					$("#formularioComercial").show();
					break;
				}
				}
			}
			);
};
</script>