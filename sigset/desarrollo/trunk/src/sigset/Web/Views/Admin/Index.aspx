<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administracion
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Administracion de Tablas</h2>
                
     <div class="three-column-container">
                <div class="three-column-left">
                <ul>
                <%
                  int columna1 = (MetaModel.Default.Tables.Count / 2);
                  for (int i = 0; i < columna1 ; i++)
                  {%>
                   <li><a href="#" onClick="window.open('<% = MetaModel.Default.Tables[i].GetActionPath("List") %>','<% =MetaModel.Default.Tables[i].DisplayName %>','width=800,height=600')" ><% =MetaModel.Default.Tables[i].DisplayName %></a></li>
                 <% } %>
                </ul>
                </div>
                <div class="three-column-middle">
                <ul>
                <%  for (int i = columna1 ; i < MetaModel.Default.Tables.Count  ; i++)
                  {%>
                   <li><a href="#" onClick="window.open('<% = MetaModel.Default.Tables[i].GetActionPath("List") %>','<% =MetaModel.Default.Tables[i].DisplayName %>','width=800,height=600')" ><% =MetaModel.Default.Tables[i].DisplayName %></a></li>
                 <% } %>
                 </ul>
                </div>
                <div class="three-column-right">
                </div>
                <div class="clear"></div>
       </div>
</asp:Content>
