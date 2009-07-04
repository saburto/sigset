<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Usuario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Usuarios</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Usuario
            </th>
            <th>
                Tipo Usuario
            </th>
            <th>
                Empleado
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Editar", "Editar", new { id=item.Id }) %> |
                <%= Html.ActionLink("Detalles", "Detalles", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Id)) %>
            </td>
            <td>
                <%= Html.Encode(item.Usuario1) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Tipo_Usuario)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Empleado)) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Crear Nuevo", "Crear") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

