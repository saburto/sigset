<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<%@page import="cl.sigti.sigset.modelo.Marca"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
</head>
<body>
<div id="tabs">
<ul>
	<li><a href="#tab1">Tab1</a></li>
</ul>

<div id="tab1">
	<ul>
		<p>${nombre}</p>
	</ul>
	
	<%if(request.getAttribute("obj") != null){ %>
	<% Marca marca = (Marca) request.getAttribute("obj"); %>
	<p>
		<%=marca.getDescripcion() %>
	</p>
	<%} %>
</div>
</div>
</body>
</html>
