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
					<legend>Listado Empresas</legend>
				    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
			        <tr>
			            <th>
			                Id
			            </th>
			            <th>
			                Nombre Empresa
			            </th>
			            <th>
			                Nombre Corto
			            </th>
			            <th>
			                Usuario Encargado
			            </th>
			          
			            
			        </tr>
    <% boolean alter = false; %>
    <% List<Empresa> empresas = (List<Empresa>) request.getAttribute("empresas"); %>
    <% for(Empresa empresa : empresas)
       { %>
    <%if (alter)
      { %>
        <tr class="row-alternating">
    <%}
      else
      {
        %>  
        <tr>
    <%}%>
    <%alter = !alter;%>
          	<td>
                <%=empresa.getId()%>
            </td>
            <td>
                <%=empresa.getNombre() %>
            </td>
            <td>
                <%=empresa.getNombreCorto()%>
            </td>
          
                         
	<%}%>
	</tr>
	</table>				
			</fieldset>		
				
		</div>
</div>