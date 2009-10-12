<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="d" %>
<div id="tabs">
	<ul>
		<li><a href="#usuario">Datos Usuario</a></li>
		
	</ul>
	<form  method="post" action="/usuario/crear/" id="formularioUsuario">
		<div id="usuario">
				<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
					<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
				</div>
				<fieldset>	
				<legend>Usuario Encargado</legend>
				<div class="three-column-container">
               		 <div class="three-column-left">					   	                
				                    <label>Nombre Usuario:</label>
				                   	<input type="text" name="usuario" title="Nombre usuario" type="text" class="required lettersonly"  />
				                   	<p>	                
				                    <label for="activo" style="display:inline !important;">Activo:</label>
				                    <label for="si" style="display:inline !important;" >Si:</label>
				                    <input type="radio" id="true" name="activo" value="1">
				                	<label for="no" style="display:inline !important;" >No:</label>
				                    <input type="radio" id="false" name="activo" value="2">
				            		</p>	
				     </div>
				     <div class="three-column-left">		            	
				             	 	<label>Contrase&ntilde;a</label> 
				                   	<input type="password" name="password" title="Contrase&ntilde;a usuario" />				      
				     </div>
				     <div class="three-column-right">
							       <label>Perfil</label> 
							       <select name="perfil" >
							       		<option selected="selected" value="0">Seleccione perfil</option>
							       		<option value="1" >Perfil Uno</option>
							       		<option value="2" >Perfil Dos</option>
							       </select>							  
				     </div>				     
			     </div>				
				</fieldset>
				
				<fieldset>
				<legend>Antecedentes Personales</legend>
				<div class="three-column-container"> 
									   	                
					                <label>Rut:</label>
					              	<input name="rut" title="Rut de Usuario Ej(12345456-9)" class="required rut" type="text"  />	
					
				</div>
				
				
				<div class="three-column-container">
               		 <div class="three-column-left">					   	                
				                    <label>Nombres:</label>
				                   	<input type="text" name="nombre" title="Nombres" type="text" class="required lettersonly"  />
				                   	<label>Email:</label>
				                   	<input type="text" name="email" title="Email" class="email" /> 	
				                  
				     </div>
				     <div class="three-column-left">		            	
				             	 	<label>Apellido Paterno:</label> 
				                   	<input type="text" name="apellidoPaterno"  />	
				                    <label>Tel&eacute;fono:</label>
				                   	<input type="text" name="telefono" title="Telefono" class="required digits" /> 				      
				     </div>
				     <div class="three-column-right">
							       <label>Apellido Materno:</label> 
							       <input type="text" name="apellidoMaterno"/>							  
				     </div>				     
			     </div>										
				</fieldset>
				
				<fieldset>
					 <div style="text-align: right;float: right;">
						<input type="submit" class="button-big" value="Guardar" />
					 </div>
				</fieldset>				
		
		</div>
	</form>
</div>
<script type="text/javascript" language="javascript">
InitForm = function () {

	
	//$('#tabs').tabs('option', 'disabled', [1, 2]);
	//$("#articulo input").attr("disabled","disabled");
	//$("#orden input").attr("disabled","disabled");
	
	$("#formularioUsuario").validate({
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
				$("#usuario input").removeAttr("disabled");
				$.scrollTo("usuario");				 
			}
		});


		$("#formularioUsuario input").tooltip({ 
				 
			    track: true, 
			    delay: 0, 
			    showURL: false, 
			    showBody: " - ", 
			    fade: 250,
			    opacity:1
			    //extraClass:"tooltip"
		 
		});	
		
		
	
};

		
</script>
	