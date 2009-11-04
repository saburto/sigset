<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Articulo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Modelo
            </th>
            <th>
                Observacion
            </th>
            <th>
                Marca
            </th>
            <th>
                TipoArticulo
            </th>
            <th>
                Categoria
            </th>
            <th>
                PrecioGarantia
            </th>
            <th>
                Linea
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Id)) %>
            </td>
            <td>
                <%= Html.Encode(item.Modelo) %>
            </td>
            <td>
                <%= Html.Encode(item.Observacion) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Marca)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.TipoArticulo)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Categoria)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.PrecioGarantia)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Linea)) %>
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

