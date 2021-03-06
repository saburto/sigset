<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Detalle>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Asignar <%=Html.Encode("T�cnico") %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Asignar <%=Html.Encode("T�cnico") %> a Orden</h2>

    <%= Html.ValidationSummary("Asignaci�n incorrecta con los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend><%=Html.Encode("Asignaci�n") %></legend>
                <%= Html.Hidden("IdOrden", Model.IdOrden) %>
                <%= Html.Hidden("rutTecnico", TempData["rutTecnico"]) %>
            <p>
                <label for="Detalle1"><%=Html.Encode("Detalle de la asignaci�n:")%> </label>
                <%= Html.TextArea("Detalle1") %>
                <%= Html.ValidationMessage("Detalle1", "*") %>
            </p>
            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

