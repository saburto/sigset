<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Tecnico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Html.Encode("Editar técnico") %></h2>

    <%= Html.ValidationSummary("No se ha realizado edición. Favor corrija los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend><%= Html.Encode("Editar Técnico:")%></legend>
            <p>
               <%= Html.Encode (Model.Empleado.Nombre + " " + Model.Empleado.Apellido_Paterno + " " + Model.Empleado.Apellido_Materno )%>
            </p>
            <p> 
               <%= Html.Encode(Model.Rut.GetRutCompleto()) %>
            </p>
            <p>
                <label for="Nivel">Nivel:</label>
                <%= Html.DropDownList("niveles") %>
            </p>
            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Volver", "Lista") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

