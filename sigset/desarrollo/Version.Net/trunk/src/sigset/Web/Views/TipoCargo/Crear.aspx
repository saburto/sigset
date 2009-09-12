<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Tipo_Cargo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear</h2>

    <%= Html.ValidationSummary("No es posible crea Tipo Cargo. Favor corrija los siguietes errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Crear Tipo Cargo</legend>
            <p>
                <label for="Id_Tipo_Cargo">Id Tipo Cargo:</label>
                <%= Html.TextBox("Id_Tipo_Cargo") %>
                <%= Html.ValidationMessage("Id Tipo Cargo", "*") %>
            </p>
            <p>
                <label for="Descripcion">Descripcion:</label>
                <%= Html.TextBox("Descripcion") %>
                <%= Html.ValidationMessage("Descripción", "*") %>
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

