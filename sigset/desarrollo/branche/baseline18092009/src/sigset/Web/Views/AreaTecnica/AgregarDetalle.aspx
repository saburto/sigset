<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Detalle>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AgregarDetalle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Agregar Detalle</h2>
    <%= Html.ValidationSummary("Agregar detalles fallida con los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend><%=Html.Encode("Detalle") %></legend>
                <%= Html.Hidden("Id_Orden", Model.Id_Orden) %>
            <p>
                <%=Html.DropDownList("Estado")%>
            </p>
            <p>
                <label for="Detalle1"><%=Html.Encode("Detalle:")%> </label>
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

