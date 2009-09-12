<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Tipo_Cargo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar</h2>

    <%= Html.ValidationSummary("No se ha modificado el dato. Revisar lo siguiente.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Editar Tipo Cargo</legend>
            <p>
                <label for="Id_Tipo_Cargo">Id Tipo Cargo:</label>
                <%= Html.TextoSoloLectura("Id_Tipo_Cargo", String.Format("{0}", Model.Id_Tipo_Cargo)) %>
                <%= Html.ValidationMessage("Id_Tipo_Cargo", "*") %>
            </p>
            <p>
                <label for="Descripcion">Descripcion:</label>
                <%= Html.TextBox("Descripcion", Model.Descripcion) %>
                <%= Html.ValidationMessage("Descripción", "*") %>
            </p>
            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    <div>
    <p>
        <%=Html.ActionLink("Volver Atrás", "Lista") %>
    </p>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

