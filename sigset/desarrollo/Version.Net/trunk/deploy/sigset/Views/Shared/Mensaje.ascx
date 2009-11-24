<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<h2>
<%if (Model != null && Model.ToString().isNotNull())
  { %>
    <%=Model.ToString()%>
<%} %>
</h2>

