<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div id="tabs">
	<ul>
		<li><a href="#cliente">Mantenedor Empresa</a></li>
	</ul>
	<div id="Empresa">
		<form  method="post" action="/sistema/empresa/crear">					
			<div id="formularioEmpresa">
			<fieldset>
			<legend>Crear Empresa</legend>
			<div>
			 	<label>Rut:</label>				 	
			 	<input type="text" name="rut" />				
			</div>
			<div class="three-column-container">
				<div  class="three-column-left">			 	
				 	<label>Raz&oacute;n social:</label>
				 	<input type="text" name="nombre" />
				 	<label>Direcci&oacute;n:</label>
				 	<input type="text" name="direccion" />
				 	<label>Correo Electr&oacute;nico</label>
				 	<input type="text" name="email" />
				 	<label>Telefono:</label>
				 	<input type="text" name="telefono"/>
				 	<label>Usuario Encargado:</label>
				 	<input type="text" name="usuarioEncargado"/>
				</div>
				<div  class="three-column-left">				 	
				 					 	
				 	<label>Inicio Contrato:</label>				
				 	<input type="text" name="inicioContrato"/>				 					 					 	
	     	 	    <label>Fin Contrato:</label>
				 	<input type="text" name="finContrato"/>
				 	<label>Activo</label>
				 	<input type="text" name="activo"/>
				 	<label>Limite de usuario</label>
				 	<input type="text" name="limiteUsuario"/>
				</div>
				</div>	
				<div class="three-column-left">
				</div>
						
			</div>	
			</fieldset>						
			<label for="observacion">Observaciones</label>
			<textarea name="observaciones"></textarea>
			<input type="submit" value="guardar"></input>
		</form>
	</div>
</div>
