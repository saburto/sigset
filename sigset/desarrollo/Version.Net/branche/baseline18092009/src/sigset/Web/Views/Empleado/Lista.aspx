<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Empleado>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista</h2>
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th></th>
            <th>
                Rut
            </th>
            <th>
                Nombre
            </th>
            <th>
                Apellido Paterno
            </th>
            <th>
                Apellido Materno
            </th>
        </tr>
    <%bool alter = false; %>
    <% foreach (var item in Model) { %>
        <%if (alter)
      { %>
        <tr class="row-alternating">
    <%}
      else
      { %>
        <tr>
    <%} %>
    
            <td>
                <%= Html.ActionLink("Editar", "Editar", new { id = item.Rut }) %> |
                <%= Html.ActionLink("Detalles", "Detalles", new { id =item.Rut })%>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Rut.GetRutCompleto())) %>
            </td>
            <td>
                <%= Html.Encode(item.Nombre) %>
            </td>
            <td>
                <%= Html.Encode(item.Apellido_Paterno) %>
            </td>
            <td>
                <%= Html.Encode(item.Apellido_Materno) %>
            </td>
        </tr>
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Crear Nuevo Empleado", "Crear") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

