<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="d" %>




<%@page import="cl.sigti.sigset.modelo.Empresa"%><div id="tabs">
	<ul>
		<li><a href="#empresa">Datos Empresa</a></li>
		<li><a href="#contrato">Datos Contrato</a></li>
		<li><a href="#usuario">Datos Usuario</a></li>
	</ul>
	<%Empresa empresa = (Empresa) request.getAttribute("empresa");%>
	
	
	
	<form  method="post" action="/empresa/crear/" id="formularioEmpresa">					
		<div id="empresa">
			<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
					<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
			</div>	
	   		<fieldset>		
					<legend>Editar Empresa</legend>
					<div class="three-column-container">
					
						<div  class="three-column-left">
					 		<label>Rut:</label>				 	
					 		<input type="text" name="rutEmpresa" title="Rut de Empresa Ej(12345456-9)" class="required rut"
					 			value="<%=empresa.getRut() %>"	 />
					 	</div>
						<div  class="three-column-left">
					 		<label>Raz&oacute;n social:</label>				 	
					 		<input type="text" name="nombre" title="Nombre Raz&oacute;n social" type="text" class="required lettersonly"
					 		value="<%=empresa.getNombre() %>" />
					 	</div>
						<div  class="three-column-rigth">		
					 		<label>Nombre Corto:</label>				 	
					 		<input type="text" name="nombreCorto" title="Nombre corto" type="text" class="required lettersonly"
					 		value="<%=empresa.getNombreCorto()%>"  />			 
					    </div>
					    					
					</div>
			</fieldset>
			
			<div>
			
			<fieldset>
	<legend>Direcci&oacute;n</legend>
	<div class="three-column-container">
    	<div class="three-column-left">
			<label for="calle">Calle:</label>
			<input type="text" name="calle"  value="<%=empresa.getDireccion().getCalle()%>" class="required" />
		</div>
		<div class="three-column-middle">
			<label for="numero">N&uacute;mero:</label>
			<input type="text" name="numero" value="<%=empresa.getDireccion().getNumero() %>" class="required" />
       	</div>
  	</div>
	<div class="three-column-container">
	  	<div class="three-column-left">
			<label for="region">Regi&oacute;n:</label>
			<input id="Region_DISPLAY_TEXT" name="Region_DISPLAY_TEXT" type="text" value="" class="required" />
			<input id="region" name="region" type="hidden" value="<%=empresa.getDireccion().getRegion() %>" />
        </div>
 	    <div class="three-column-middle">
			<label for="provincia">Provincia:</label>
			<input id="Provincia_DISPLAY_TEXT" name="Provincia_DISPLAY_TEXT" type="text" value="" class="required" />
			<input id="provincia" name="provincia" type="hidden" value="<%=empresa.getDireccion().getProvincia() %>"  />
    	</div>
    	<div class="three-column-right">
			<label for="comuna">Comuna:</label>
			<input id="Comuna_DISPLAY_TEXT" name="Comuna_DISPLAY_TEXT" type="text" value="" class="required" />
			<input id="comuna" name="comuna" type="hidden" value="<%=empresa.getDireccion().getComuna() %>"   />
       	</div>
	</div>
	</fieldset>
			
			</div>
	        
			  <fieldset>
						<legend>Contacto</legend>
						<div class="three-column-container">					
							<div class="three-column-left">
								<label>Email:</label>								  		
								<input type="text" name="contactoEmail" value="<%=empresa.getEmail()%>"  class="email"/>
													  
							</div>
							<div class="three-column-left">
								<label for="rut">Telefono:</label>
								<input type="text" name="contactoTelefono" value="<%=empresa.getTelefono()%>"  class="required digits"  />
							</div>
						
						</div>
			  </fieldset>
			  <fieldset>
						<div style="text-align: right;float: right;">
							<input type="button" class="button-big" value="Siguiente"  id="anterior" onclick="irSiguienteDe(0,'contrato')" />
						</div>
		 	  </fieldset>
		</div>	
		<div id="contrato"> 
			<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
					<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
			</div>	
				  <fieldset>
		 		     <legend>Datos Contrato</legend>
						
						<div class="three-column-container">
						
							<div  class="three-column-left">
							 		<label>Limite de usuarios:</label>				 	
							 		<input type="text" name="limiteUsuario" class="required digits" />
						 	</div>
							<div  class="three-column-left">
							 		<label>Inicio Contrato:</label>	
							 		<input type="text" name="inicioContrato" id="inicioContrato" />
							</div> 
							
							<div  class="three-column-right;">
								 	<label>Fin Contrato:</label>
								 	<input type="text" name="finContrato" id="finContrato" />   				
							</div>
								
						</div>			
						
				</fieldset>	
			    <fieldset>
					    <legend>Estado</legend>
					    
					     <div class="three-column-container">
               					 <div class="three-column-left">
					   			 <p>	                
				                    <label for="activo" style="display:inline !important;">Activo:</label>
				                    <label for="si" style="display:inline !important;" >Si:</label>
				                    <input type="radio" id="true" name="activo" value="1">
				                	<label for="no" style="display:inline !important;" >No:</label>
				                    <input type="radio" id="false" name="activo" value="2">				            	    
				           		</p>
				           </div>
				        </div>
				   													    
				</fieldset>   		   
				<fieldset>
					    <legend>Otros</legend>
						<label for="observacion">Observaciones</label>
						<textarea name="observaciones"></textarea>				
				</fieldset>	
				<fieldset>
					 	 <div style="text-align: left;float: left;">
								<input 
								type="button" 
								class="button-big" 
								value="Anterior" 
								id="anterior"
								onclick="irAnteriorDe(1,'empresa')"
								/>
						</div>
						<div style="text-align: left;float: right;">
								<input 
								type="button" 
								class="button-big" 
								value="Siguiente" 
								id="siguiente"
								onclick="irSiguienteDe(1,'usuario')"
								/>
	      				 </div>
						
				</fieldset>
		</div>	
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
							       <select name="perfilTipo" >
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
					              	<input name="rutUsuario" title="Rut de Ususario Ej(12345456-9)" class="required rut" type="text"  />
					              		
					
				</div>
				
				
				<div class="three-column-container">
               		 <div class="three-column-left">					   	                
				                    <label>Nombres:</label>
				                   	<input type="text" name="nombres" title="Nombres" type="text" class="required lettersonly"  />
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
				 <div style="text-align: left;float: left;">
								<input
								type="button" 
								class="button-big" 
								value="Anterior" 
								id="anterior"
								onclick="irAnteriorDe(2,'contrato')"
								/>
					</div>
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
	
	$("#formularioEmpresa").validate({
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
				form.submit();
			}
		});


		$("#formularioEmpresa input").tooltip({ 
				 
			    track: true, 
			    delay: 0, 
			    showURL: false, 
			    showBody: " - ", 
			    fade: 250,
			    opacity:1
			    //extraClass:"tooltip"
		 
		});	
		
		
		$('#inicioContrato').datepicker();
		$('#finContrato').datepicker();


		};

function irAnteriorDe(indexTabActual, idTabAnterior){
	$("#tabs").tabs( 'select' , indexTabActual - 1 );
	$.scrollTo("#" + idTabAnterior );
}
function irSiguienteDe(indexTabActual, idTabAnterior){
	$("#tabs").tabs( 'select' , indexTabActual + 1 );
	$.scrollTo("#" + idTabAnterior );
}

		
</script>


