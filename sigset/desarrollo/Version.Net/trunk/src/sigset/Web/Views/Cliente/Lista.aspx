<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Cliente>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Clientes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Clientes</h2>
    
    <table>
    <tr>
    <td style="width:60%;vertical-align:top;">
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th></th>
            <th>
                Rut
            </th>
            <th>
                Apellidos
            </th>
            <th>
                Nombre
            </th>
            <th>
                Orden de Trabajo
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
      {
        %>  
        <tr>
    <%}

      alter = !alter;       %>
       
            <th scope="row">
                <%= Html.ActionLink("Editar", "Editar", new { id = item.Rut })%> |
                <%= Ajax.ActionLink("Ver", "Detalles", new { id = item.Rut }, new AjaxOptions { HttpMethod = "GET", LoadingElementId = "loadingAjax", UpdateTargetId = "detallesCliente" })%>
            </th>
            <td>
                <%= Html.Encode(item.Rut.GetRutCompleto())%>
            </td>
            <td>
                <%= Html.Encode(item.ApellidoPaterno)%> <%= Html.Encode(item.ApellidoMaterno)%>
            </td>
            <td>
                <%= Html.Encode(item.Nombre)%>
            </td>
            <td>
                <%=Html.ActionLink("Agregar", "Crear", "OrdenTrabajo", new { rut = item.Rut }, null)%>
            </td>
        </tr>
    
    <% } %>      
    </table>
    </td>
    <td id="detallesCliente" style="width:40%; vertical-align:top;" ></td>
    </tr>
    </table>

    <p>
        <%= Html.ActionLink("Nuevo Cliente", "Crear") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

