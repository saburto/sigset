<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>


<%@ attribute name="urlAction" required="true" %>
<%@ attribute name="claseModelo" required="true"  %>
<%@ attribute name="commandName" required="true" %>
<%@ attribute name="leyenda" required="false" %>

<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ tag import="java.util.List"%>
<%@ tag import="java.lang.reflect.Field"%>
<%@ tag import="cl.sigti.sigset.util.modelo.Form"%>
<%@ tag import="cl.sigti.sigset.util.modelo.InputType"%>
<%@ tag import="org.springframework.web.util.HtmlUtils"%>


<%@tag import="java.util.Arrays"%>
<%@tag import="cl.sigti.sigset.util.tags.FieldFormHelper"%><s:url var="url" value="${urlAction}" />
<form:form action="${url}" commandName="${commandName}">
	<fieldset>
		<c:if test="${leyenda != null}" >
			<legend>${leyenda}</legend>
		</c:if>
			<%	
				FieldFormHelper fieldsForm = new FieldFormHelper(Class.forName(claseModelo).getDeclaredFields());
				for(int i = 0; i < fieldsForm.getTotalColumnas(); i++){%>
					<div class="three-column-container">
					<%for(Field obj : fieldsForm.getListaCampos(i) ) {%>
						<div class="<%= ((obj.getAnnotation(Form.class).columna()) == 2) ? "three-column-right": "three-column-middle" %>">
							<%if(obj.getAnnotation(Form.class).type().equals(InputType.HIDDEN)){ %>
								<form:hidden path="<%=obj.getName() %>"/>
							<%}else if(obj.getAnnotation(Form.class).type().equals(InputType.PASSWORD)){ %>
								<form:label path="<%=obj.getName() %>" ><%=HtmlUtils.htmlEscape(obj.getAnnotation(Form.class).label())%>:</form:label>
								<form:password path="<%=obj.getName() %>"/>
							<%}else{ %>		
								<form:label path="<%=obj.getName() %>" ><%=obj.getAnnotation(Form.class).label()%>:</form:label>
								<form:input path="<%=obj.getName() %>"/>
							<%} %>						
						</div>
					<%} %>
					</div>
					<div class="clear"></div>
				<%} %>
		<div class="clear"></div>
	<br />
	<input type="submit" value="Guardar" class="button-big"/>
	</fieldset>
</form:form>
