<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% if (Html.IsCurrentAction("Index", "Home")) { %>
<li class="first active"><span class="active"></span><%= Html.ActionLink("Home", "Index", "Home") %></li>
<% } else { %>
<li class="first"><%= Html.ActionLink("Home", "Index", "Home") %></li>
<% }%>

<% if (Html.IsCurrentAction("About", "Home")) { %>
<li class="active"><span class="active"></span><%= Html.ActionLink("About", "About", "Home") %></li>
<% } else { %>
<li><%= Html.ActionLink("About", "About", "Home") %></li>
<% }%>