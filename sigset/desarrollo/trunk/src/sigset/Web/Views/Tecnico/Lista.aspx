<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Tecnico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista Técnicos Registrados</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Rut
            </th>
            <th>
                Nivel
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Editar", "Editar", new { id=item.Rut }) %> |
                <%= Html.ActionLink("Detalles", "Detalles", new { id=item.Rut })%>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Rut.GetRutCompleto())) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Nivel)) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Crear Nuevo Técnico", "Crear") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

