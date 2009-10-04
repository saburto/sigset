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

	<form:form action="/admin/empresa/crear/" commandName="empresa">
		<fieldset>
		<legend>Datos Empresa</legend>
			<div class="three-column-container">
				<div class="three-column-middle">
					<form:label path="rut">Rut</form:label>
					<form:input path="rut"/>
				</div>
				<div class="three-column-middle">
					<form:label path="nombre">Nombre</form:label>
					<form:input path="nombre"/>
				</div>
				<div class="three-column-right">
					<form:label path="nombreCorto">Nombre Corto</form:label>
					<form:input path="nombreCorto"/>
				</div>
			</div>
			<div class="clear"></div>
		</fieldset>
		<fieldset>
				<legend>Contacto</legend>
				<div class="three-column-container">
					<div class="three-column-middle">
						<form:label path="email">Email</form:label>
						<form:input path="email"/>
					</div>
					<div class="three-column-middle">
						<form:label path="telefono">Telefono</form:label>
						<form:input path="telefono"/>
					</div>
				</div>
				<div class="clear"></div>
		</fieldset>
		<fieldset>
			<legend>Direcci&oacute;n</legend>
			<div class="three-column-container">
				<div class="three-column-middle">
					<form:label path="region">Regi&oacute;n</form:label>
					<form:input path="region"/>
				</div>
				<div class="three-column-middle">
					<form:label path="provincia">Provincia</form:label>
					<form:input path="provincia"/>
				</div>
				<div class="three-column-right">
					<form:label path="comuna">Comuna</form:label>
					<form:input path="comuna"/>
				</div>
			</div>
			<div class="clear"></div>
			<div class="three-column-container">
				<div class="three-column-middle">
					<form:label path="calle">Calle</form:label>
					<form:input path="calle"/>
				</div>
				<div class="three-column-middle">
					<form:label path="numero">Numero</form:label>
					<form:input path="numero"/>
				</div>
			</div>
		</fieldset>
		<input type="submit" value="Guardar" class="button-big" />
	</form:form>
</div>


</div>
</body>
</html>
