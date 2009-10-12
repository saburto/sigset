<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ tag import="java.util.List"%>
<%@ tag import="org.springframework.validation.ObjectError"%>
<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
</div>
	<% if(request.getAttribute("errores") != null){ %>
		<% List<ObjectError> errores = (List<ObjectError>) request.getAttribute("errores");  %>
		<div class="errorContainer ui-state-error ui-corner-all">
		<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span>
		<span  class="errorMessage">
		<ul>
		<% for(ObjectError error : errores){ %>
			<li><%=error.getDefaultMessage() %></li>
		<%} %>
		</ul>
		</span>
		</p>
		</div>		
		<%} %>