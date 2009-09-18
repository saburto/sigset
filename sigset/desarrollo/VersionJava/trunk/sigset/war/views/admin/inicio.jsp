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
<ul>
<%
List<Usuario> usuarios =(List<Usuario>) request.getAttribute("usuarios");
for(Usuario u: usuarios){ %>

<li><%=u.getNombresApellido() %></li>

<%} %>
</ul>
<cf:Form claseModelo="cl.sigti.sigset.modelo.Usuario" urlAction="/admin/crear/" commandName="usuario" />

</body>
</html>