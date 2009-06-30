<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Empleado>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear</h2>

    <%= Html.ValidationSummary("No se puede Crear Nuevo Empleado. Favor corrija los errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Datos Personales:</legend>
            <p>
                <label for="Rut">Rut:</label>
                <%= Html.TextBox("Rut") %>
                <%= Html.ValidationMessage("Rut", "*") %>
            </p>
            <p>
                <label for="Nombre">Nombre:</label>
                <%= Html.TextBox("Nombre") %>
                <%= Html.ValidationMessage("Nombre", "*") %>
            </p>
            <p>
                <label for="Apellido_Paterno">Apellido Paterno:</label>
                <%= Html.TextBox("Apellido_Paterno") %>
                <%= Html.ValidationMessage("Apellido_Paterno", "*") %>
            </p>
            <p>
                <label for="Apellido_Materno">Apellido Materno:</label>
                <%= Html.TextBox("Apellido_Materno") %>
                <%= Html.ValidationMessage("Apellido_Materno", "*") %>
            </p>
            <p>
                <label for="Tipo_Cargo">Tipo Cargo:</label>
                <select id="Tipo_Cargo">
                <option value="0" selected="selected">Seleccione Tipo de Cargo</option>
                <option value="1">Tecnico</option>
                <option value="2">Recepcionista</option>
                <option value="3">Administrador</option>
                </select>
            </p>
            
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Volver Atrás", "Lista") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

