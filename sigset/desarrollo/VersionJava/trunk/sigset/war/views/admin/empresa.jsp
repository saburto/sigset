<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cf" %>

<%@page import="java.util.List"%>
<%@page import="cl.sigti.sigset.modelo.Empresa"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Empresas</title>
</head>
<body>
<div id="tabs">
<ul>
	<li><a href="#Empresas">Empresas</a></li>
	<li><a href="#nueva">Nueva Empresa</a></li>
</ul>

<div id="Empresas">
	<ul>
		<% List<Empresa> lista =(List<Empresa>) request.getAttribute("empresas"); %>
		<% for(Empresa e: lista){ %>
		<li><%= e.getNombre() + "/" + e.getNombreCorto() %></li>
		<%} %>
	</ul>
</div>
<div id="nueva">
	<cf:Form claseModelo="cl.sigti.sigset.modelo.Empresa" urlAction="/admin/empresa/crear/" commandName="empresa" />
</div>


</div>
</body>
</html>
