<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>


<%@ attribute name="urlAction" required="true" %>
<%@ attribute name="claseModelo" required="true"  %>
<%@ attribute name="commandName" required="true" %>


<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ tag import="java.util.List"%>
<%@ tag import="java.lang.reflect.Field"%>
<%@ tag import="cl.sigti.sigset.util.modelo.Form"%>
<%@ tag import="cl.sigti.sigset.util.modelo.InputType"%>
<%@ tag import="org.springframework.web.util.HtmlUtils"%>

<s:url var="url" value="${urlAction}" />
<form:form action="${url}" commandName="${commandName}">
	<fieldset>
	<%for(Field obj : Class.forName(claseModelo).getDeclaredFields()) {%>
	
		<%if(obj.getAnnotation(Form.class) == null) continue; %>
		
			<%if(obj.getAnnotation(Form.class).type().equals(InputType.HIDDEN)){ %>
				<form:hidden path="<%=obj.getName() %>"/>
			<%}else if(obj.getAnnotation(Form.class).type().equals(InputType.PASSWORD)){ %>
				<form:label path="<%=obj.getName() %>" ><%=HtmlUtils.htmlEscape(obj.getAnnotation(Form.class).label())%>:</form:label>
				<form:password path="<%=obj.getName() %>"/>
			<%}else{ %>		
				<form:label path="<%=obj.getName() %>" ><%=obj.getAnnotation(Form.class).label()%>:</form:label>
				<form:input path="<%=obj.getName() %>"/>
			<%} %>
	<%} %>
	<br />
	<input type="submit" value="Guardar" class="button-big"/>
	</fieldset>
</form:form>
