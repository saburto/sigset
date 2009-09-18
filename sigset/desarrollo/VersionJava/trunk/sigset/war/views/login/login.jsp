<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Autenticaci&oacute;n</title>
</head>
<body>
	<h3>Iniciar sesi&oacute;n</h3>
	<form name='f' action='/login/iniciar/' method="post">
 	<table>
	    <tr>
	    	<td>Usuario:</td>
	    	<td><input type='text' name='nombre_usuario' value='' /></td>
    	</tr>
	    <tr>
	    	<td>Contrase&ntilde;a:</td>
	    	<td><input type='password' name='password'/></td>
    	</tr>
        <tr>
	    	<td>Empresa:</td>
	    	<td><input type="text" name='empresa'/></td>
    	</tr>
	    <tr>
	    	<td colspan='2'>
	    		<input name="submit" type="submit" value="Enviar"/>
   			</td>
		</tr>
	    <tr><td colspan='2'><input name="reset" type="reset" value="Borrar" /></td></tr>
  	</table>
	</form>
</body>
</html>