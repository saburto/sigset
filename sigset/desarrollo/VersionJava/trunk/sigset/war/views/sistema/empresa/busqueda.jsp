<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="d" %>


<%@page import="java.util.List"%>
<%@page import="cl.sigti.sigset.modelo.Empresa"%>
<%@page import="cl.sigti.sigset.modelo.Usuario"%>

<div id="tabs">
	<ul>
		<li><a href="#empresas">empresas</a></li>
	</ul>
		<div id="empresas">
			<fieldset>		
			
					<legend>Busqueda Usuarios</legend>
					 <div class="three-column-container">
						<div  class="three-column-left">
							<label>Rut Empresa:</label>
							<label>Nombre Usuario:</label>	
						</div>
					</div>							
			</fieldset>		
				
		</div>
</div>