<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Usuario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Usuarios</h2>
    <% if (TempData["MensajeError"] != null) %>
    <%{%>
     <h2 class ="field-validation-error" >
        <%=Html.Encode(TempData["MensajeError"])%>
     </h2>
    <%}%>

   
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
   
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

    <%bool alter = false; %>
    <% foreach (var item in Model)
       { %>
    <%if (alter)
      { %>
        <tr class="row-alternating">
    <%}
      else
      { %>
        <tr>
    <%} alter = !alter; %>
       
            <th scope="row">
                <%= Html.ActionLink("Editar", "Editar", new { id=item.Id }) %> |
                <%= Html.ActionLink("Eliminar", "Eliminar", new { id=item.Id })%>
            </th>
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
                <%= Html.Encode(String.Format("{0}", item.Empleado.GetRutCompleto())) %>
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

