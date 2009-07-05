<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Usuario</h2>

    <%= Html.ValidationSummary("No se puede crear usuario. Favor corrija los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>

      <fieldset>
            <legend>Datos del Usuario</legend>
             <p>
                <label for="Usuario1">Nombre Usuario:</label>
                <%= Html.TextBox("Usuario1") %>
                <%= Html.ValidationMessage("Usuario1", "*") %>
            </p>
            <p>
                <label for="Pass"> Contrase&ntilde;a </label>
                <%= Html.TextBox("Pass") %>
                <%= Html.ValidationMessage("Pass", "*")%>
            </p>
            <p>
                <label for="Tipo_Usuario">Tipo Usuario:</label>
                <%= Html.DropDownList("listaTipos") %>
            </p>
            <p>
                <label for="Empleado">Empleado:</label>
                <%= Html.TextBox("Empleado") %>
                <%= Html.ValidationMessage("Empleado", "*") %>
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

