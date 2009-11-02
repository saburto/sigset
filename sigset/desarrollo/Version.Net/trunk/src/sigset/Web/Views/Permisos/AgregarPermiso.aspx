<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Permiso>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AgregarPermiso
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>AgregarPermiso</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Mod_Id
            </th>
            <th>
                Opcion
            </th>
            <th>
                DescripcionOpcion
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <%= Html.Encode(item.Mod_Id) %>
            </td>
            <td>
                <%= Html.Encode(item.Opcion) %>
            </td>
            <td>
                <%= Html.Encode(item.DescripcionOpcion) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

