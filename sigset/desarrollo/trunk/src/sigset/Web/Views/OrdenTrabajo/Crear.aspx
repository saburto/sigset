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
                    <label for="nombre">Nombre:</label>
                    <%= Html.TextBox("nombre")%>
                    <%= Html.ValidationMessage("nombre","*") %>
                 </p>
                 <p>
                    <label for="apellido_paterno">Apellido Paterno:</label>
                    <%= Html.TextBox("apellido_paterno")%>
                    <%= Html.ValidationMessage("apellido_paterno", "*")%>
                 </p>
                 <p>
                    <label for="apellido_materno">Apellido Materno:</label>
                    <%= Html.TextBox("apellido_materno")%>
                    <%= Html.ValidationMessage("apellido_materno", "*")%>
                 </p>
                 <p>
                    <input type="submit" value="Enviar" />
                </p>
            </fieldset>
        </div>
    
    
    <%} %>

</asp:Content>
