<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div id="tabs">
	<ul>
		<li><a href="#Empresa">Datos Empresa</a></li>
		<li><a href="#Contrato">Datos Contrato</a></li>
	</ul>
<form  method="post" action="/sistema/empresa/crear">					
	
	<div id="Empresa">
			<div id="formularioEmpresa">
			<fieldset>
			<legend>Crear Empresa</legend>
			<div>
			<div class="three-column-container">
				<div  class="three-column-left">
			 		<label>Rut:</label>				 	
			 		<input type="text" name="rut" />
			 	</div>
			</div>	
			<div class="three-column-container">
				<div  class="three-column-left">
			 		<label>Raz&oacute;n social:</label>				 	
			 		<input type="text" name="nombre" />
			 	</div>
			</div>		
			<div class="three-column-container">			
			 		<label>Nombre Corto:</label>				 	
			 		<input type="text" name="nombreCorto" />			 
			</div>					
			</div>
			</fieldset>
			<fieldset>					
			<div class="three-column-container">
				<div  class="three-column-left">	
				 	<label>Direcci&oacute;n:</label>
				 	<input type="text" name="direccion" />   
				</div>
			</div>
		    </fieldset>
		    <fieldset>
		      <div class="three-column-container">
				<div  class="three-column-left">
		        	<label>Correo Electr&oacute;nico</label>
				 	<input type="text" name="email" />
				</div>
			</div>	
		     <div class="three-column-container">
				<div  class="three-column-left">
		         	<label>Tel&eacute;fono:</label>
				 	<input type="text" name="telefono"/>
				</div>
			</div>	 
		    </fieldset>   	  
		   
			</div>
		
	</div>
	<div id="Contrato"> 
	<fieldset>
	<legend>Datos Contrato</legend>
			<div>
			<div class="three-column-container">
				<div  class="three-column-left">
			 		<label>Usuario Encargado:</label>				 	
			 		<input type="text" name="usuarioEncargado" />
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
		      <div class="three-column-container">
				<div  class="three-column-left">
		        	<label>Activo</label>
				 	<input type="text" name="activo" />
				</div>
			</div>			    
		    </fieldset>   		   
		    <fieldset>
				<label for="observacion">Observaciones</label>
				<textarea name="observaciones"></textarea>
				<input type="submit" value="guardar"></input>
			</fieldset>	
	
	</div>	
</form>
</div>
