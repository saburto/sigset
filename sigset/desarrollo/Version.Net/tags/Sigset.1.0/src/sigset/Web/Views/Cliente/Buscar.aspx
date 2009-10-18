<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Buscar Cliente
</asp:Content>
<asp:Content ID="ContentHead" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.ValidationSummary("Error al buscar.") %>
    <% using (Ajax.BeginForm(new AjaxOptions{ LoadingElementId="loadingAjax", UpdateTargetId="resultado"}))
       { %>
    <div>
            <fieldset>
            <legend>Buscar Cliente</legend>
            <div class="three-column-container">
            <div class="three-column-left">
                <p>
                    <label for="Rut">Buscar por Rut:</label>
                    <%= Html.RutTextBox()%>
                    <%= Html.ValidationMessage("Rut", "*")%>
                 </p>
            </div>
            <div class="clear"></div>
             </div>
                <p>
                    <input type="submit" value="Buscar" />
                </p>
                
            </fieldset>
        </div>
    <%} %>
    <p>
    <div id="resultado"></div>
    </p>
    <p>
        <%=Html.ActionLink("Nuevo Cliente", "Crear") %> |
        <%=Html.ActionLink("Ver Lista", "Lista") %>
    </p>
    
</asp:Content>