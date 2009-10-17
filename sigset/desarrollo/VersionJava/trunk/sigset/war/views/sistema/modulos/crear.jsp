<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="d" %>
<div id="tabs">
	<ul>
		<li><a href="#modulos">M&oacute;dulos</a></li>
		<li><a href="#permisos">Opciones M&oacute;dulos</a></li>
	</ul>				
	<div id="modulos">
		<form  method="post" action="/modulos/crear/" id="formularioModulos">		
			<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
			</div>
			<fieldset>		
					<legend>Crear M&oacute;dulos</legend>
					<div class="three-column-container">	
						<div  class="three-column-left">
							<label>Nombre m&oacute;dulo:</label>				 	
					 		<input type="text" name="nombreModulo"  value ="#/sistema/" type="text" />
					 	</div>
					 	<div  class="three-column-right">
					 	<label>Descripci&oacute;n opci&oacute;n:</label>				 	
					 		<input type="text" name="descripcionOpcion" value="sistema" type="text"  />					 		
					 	</div>											    					
					</div>
			</fieldset>			
			<fieldset>
			     <div style="text-align: right;float: right;">
					<input type="submit" class="button-big" value="Guardar" />
				 </div>
			</fieldset>	
			</form>	
	</div>
	<div id="permisos">
			<form method="post" action="/modulos/permisos/crear/">
				<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
					<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
				</div>
				<fieldset>
					<legend>Opciones M&oacute;dulos</legend>		
					<div class="three-column-container">
						<div  class="three-column-left">
							<label>Id M&oacute;dulo:</label>				 	
					 		<input type="text" name="modulo"  type="text" class="required digits" />
					 	</div>	
						<div  class="three-column-left">
							<label>Nombre Opci&oacute;n:</label>				 	
					 		<input type="text" name="opcion"  value ="#/sistema/crear" type="text" class="required digits" />
					 	</div>
					 	<div  class="three-column-right">
					 	<label>Descripci&oacute;n opci&oacute;n:</label>				 	
					 		<input type="text" name="descripcionOpcion" value="crear sistema" type="text" class="required lettersonly" />					 		
					 	</div>											    					
					</div>
				</fieldset>
				<fieldset>
			     <div style="text-align: right;float: right;">
					<input type="submit" class="button-big" value="Guardar" />
				 </div>
			</fieldset>	
			</form>
	</div>
		
	
</div>
<script type="text/javascript" language="javascript">
InitForm = function () {

	
	//$('#tabs').tabs('option', 'disabled', [1, 2]);
	//$("#articulo input").attr("disabled","disabled");
	//$("#orden input").attr("disabled","disabled");
	
	$("#formularioPerfil").validate({
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
				$("#perfil input").removeAttr("disabled");
				$.scrollTo("perfil");				 
			}
		});


		$("#formularioPerfil input").tooltip({ 
				 
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
