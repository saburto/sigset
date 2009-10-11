<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div id="tabs">
	<ul>
		<li><a href="#Empresa">Datos Empresa</a></li>
		<li><a href="#Contrato">Datos Contrato</a></li>
	</ul>
<form  method="post" action="/sistema/empresa/crear" id="formularioEmpresa">					
	<div id="Empresa">
   		<fieldset>
			<legend>Crear Empresa</legend>
				<div class="three-column-container">
				<div  class="three-column-left">
			 		<label>Rut:</label>				 	
			 		<input type="text" name="rut" />
			 	</div>
				<div  class="three-column-left">
			 		<label>Raz&oacute;n social:</label>				 	
			 		<input type="text" name="nombre" />
			 	</div>
				<div  class="three-column-rigth">		
			 		<label>Nombre Corto:</label>				 	
			 		<input type="text" name="nombreCorto" />			 
			    </div>					
				</div>
		</fieldset>
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
		  <fieldset>
					<div style="text-align: right;float: right;">
						<input type="submit" class="button-big" value="Siguiente" />
					</div>
	 	  </fieldset>
	</div>	
	<div id="Contrato"> 
	      <fieldset>
	      <legend>Datos Contrato</legend>
					<div>
					<div class="three-column-container">
					<div  class="three-column-left">
					 		<label>Usuario Encargado:</label>				 	
					 		<input type="text" name="usuarioEncargado" />
					 		<label>Limite de usuarios:</label>				 	
					 		<input type="text" name="limiteUsuario" />
				 	</div>
					</div>	
					<div class="three-column-container">
						<div  class="three-column-left">
					 		<label>Inicio Contrato:</label>				 	
					 		<input type="text" name="inicioContrato" />
					 	</div> 
					</div>
					<div class="three-column-container">				
						 	<label>Fin Contrato:</label>
						 	<input type="text" name="finContrato" />   				
					</div>				
					</div>
		    </fieldset>	
		    <fieldset>
				    <legend>Estado</legend>
				      <div class="three-column-container">
						<div  class="three-column-left">
				        	<label>Activo</label>
						 	<input type="text" name="activo" />
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
							<input type="button" class="button-big" value="Anterior" />
					 </div>
					 <div style="text-align: right;float: right;">
							<input type="submit" class="button-big" value="Guardar" />
					 </div>
			</fieldset>
	
	</div>	
</form>
</div>
