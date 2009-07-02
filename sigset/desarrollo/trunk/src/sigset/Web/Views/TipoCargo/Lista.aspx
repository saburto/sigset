<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Tipo_Cargo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista</h2>

    <table style = "border-color" border = "1">
   
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Descripcion
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Editar", "Editar", new { id=item.Id_Tipo_Cargo }) %> |
                <%= Html.ActionLink("Detalles", "Detalles", new { id=item.Id_Tipo_Cargo })%>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Id_Tipo_Cargo)) %>
            </td>
            <td>
                <%= Html.Encode(item.Descripcion) %>
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

