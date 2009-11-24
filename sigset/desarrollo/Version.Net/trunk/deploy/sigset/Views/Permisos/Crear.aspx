<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Permiso>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Permiso
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%= Html.ValidationSummary("Favor de corregir los siguientes errores:") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Nuevo Permiso</legend>
            <p>
                <label for="Mod_Id">Modulo:</label>
                <%= Html.DropDownList("Mod_Id") %>
                <%= Html.ValidationMessage("Mod_Id", "*") %>
            </p>
            <p>
                <label for="Opcion">Opci&oacute;n:</label>
                <%= Html.TextBox("Opcion") %>
                <%= Html.ValidationMessage("Opcion", "*") %>
            </p>
            <p>
                <label for="DescripcionOpcion">Descripci&oacute;n:</label>
                <%= Html.TextBox("DescripcionOpcion") %>
                <%= Html.ValidationMessage("DescripcionOpcion", "*") %>
            </p>
        </fieldset>
        <p style="float: left">
            <%=Html.ButtonLinkIcon(Url.Action("Lista"), "Volver", Iconos.arrow_1_w, IconPosition.left, new {title="Volver a lista de permisos" })%>
        </p>
        <p style="float: right">
            <%=Html.ButtonSubmit("Crear") %>
        </p>

    <% } %>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

