<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Detalle>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Asignar Tecnico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Asignar Tecnico a Orden</h2>

    <%= Html.ValidationSummary("Asignación incorrecta con los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend><%=Html.Encode("Asignación") %></legend>
                <%= Html.Hidden("Id_Orden", Model.Id_Orden) %>
                <%= Html.Hidden("rutTecnico", TempData["rutTecnico"]) %>
            <p>
                <label for="Detalle1"><%=Html.Encode("Detalle de la asignación:")%> </label>
                <%= Html.TextArea("Detalle1") %>
                <%= Html.ValidationMessage("Detalle1", "*") %>
            </p>
            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Volver", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

