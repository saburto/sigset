<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Orden de Trabajo</h2>
    <% using(Html.BeginForm()){ %>
    <div>
            <fieldset>
            <legend>Ingresar Datos Cliente</legend>
                <p>
                    <label for="rut">Rut:</label>
                    <%= Html.TextBox("rut")%>
                    <%= Html.ValidationMessage("rut","*") %>
                </p>
                <p>
                    <input type="submit" value="Enviar" />
                </p>
            </fieldset>
        </div>
    
    
    <%} %>

</asp:Content>
