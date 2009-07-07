<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Cliente>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Clientes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Clientes</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Rut
            </th>
            <th>
                Apellido_Paterno
            </th>
            <th>
                Nombre
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.Rut }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.Rut })%>
            </td>
            <td>
                <%= Html.Encode(item.Rut.GetRutCompleto()) %>
            </td>
            <td>
                <%= Html.Encode(item.Apellido_Paterno) %>
            </td>
            <td>
                <%= Html.Encode(item.Nombre) %>
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

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

