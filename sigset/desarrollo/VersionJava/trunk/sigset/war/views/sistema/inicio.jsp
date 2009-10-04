<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cf" %>
<%@ page import="cl.sigti.sigset.modelo.Usuario"%>
<%@ page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Administraci&oacute;n</title>
</head>
<body>
<div id="tabs">
<ul>
	<li><a href="#usuarios">Lista Usuarios</a></li>
	<li><a href="#nuevo">Ingresar Nuevo Usuario</a></li>
</ul>

<div id="usuarios">
	<ul>
		<%
		List<Usuario> usuarios =(List<Usuario>) request.getAttribute("usuarios");
		for(Usuario u: usuarios){ %>
		
		<li><%=u.getNombresApellido() %></li>
		
		<%} %>
	</ul>
</div>
<div id="nuevo">
<cf:Form claseModelo="cl.sigti.sigset.modelo.Usuario" 
	urlAction="/admin/crear/" leyenda="Nuevo Usuario" 
	commandName="usuario" />
	
</div>
</div>
</body>
</html>