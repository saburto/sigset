<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="d" %>
<div id="tabs">
	<ul>
		<li><a href="#perfil">Datos Perfil</a></li>
	</ul>
	<form  method="post" action="/perfil/crear/" id="formularioPerfil">					
		<div id="perfil">
			<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
			</div>
			<fieldset>		
					<legend>Crear Perfil</legend>
					<div class="three-column-container">
					
						<div  class="three-column-left">
					 		<label>Id:</label>				 	
					 		<input type="text" name="id" )" class="required digits" />
					 	</div>
						<div  class="three-column-left">
					 		<label>Descripci&oacute;n:</label>				 	
					 		<input type="text" name="descripcion"  type="text" class="required lettersonly" />
					 	</div>
					 	<div  class="three-column-right">
					 		<label>Id Empresa:</label>				 	
					 		<input type="text" name="idEmpresa"  type="text" class="required digits" />
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
