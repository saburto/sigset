<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Error
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
<% if (Model != null)
   {%>
    <h2>
        <%=Html.Encode(Model.Exception.Message)%>
    </h2>
    <p>Controlador: <%=Model.ControllerName%></p>
    <p>Action: <%=Model.ActionName%></p>
  <% }
   else
   { %>
   <h2>Error desconocido.</h2>
    <%} %>
</asp:Content>
