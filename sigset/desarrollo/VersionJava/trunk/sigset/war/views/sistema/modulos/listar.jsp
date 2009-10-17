<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="d" %>


<%@page import="java.util.List"%>
<%@page import="cl.sigti.sigset.modelo.Modulos"%>


<div id="tabs">
	<ul>
		<li><a href="modulos">M&oacute;dulos</a></li>
	</ul>
		<div id="modulos">
			<fieldset>		
					<legend>Listado M&oacute;dulos</legend>
				    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
			        <tr>
			            <th>
			                Id Modulo
			            </th>
			            <th>
			                Nombre M&oacute;dulo
			            </th>
			            <th>
			                Descripci&oacute;n M&oacute;dulo
			            </th>	           
			            <th>
			                Opciones M&oacute;dulo
			            </th>
			          
			            
			        </tr>
    <% boolean alter = false; %>
    <%if(request.getAttribute("modulos") != null){ %>
    <% List<Modulos> modulos = (List<Modulos>) request.getAttribute("modulos"); %>
    <% for(Modulos modulo : modulos)
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
                <%=modulo.getId()%>
            </td>
            <td>
                <%=modulo.getNombreModulo() %>
            </td>
            <td>
                <%=modulo.getDescripcionOpcion()%>
            </td>        
           
            <td>
            	
                <a rel="history" href="#/permisos/listar/<%=modulo.getNombreModulo()%>">Ver</a>
            </td>
          
                         
	<%}%>
	<%}%>
	</tr>
	</table>				
			</fieldset>		
				
		</div>
</div>