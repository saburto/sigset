<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.PerfilPermiso>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Permisos del perfil
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Permisos del Perfil
        <%=Html.ViewData["perfil"] %>
    </h2>
    <% if (TempData["MensajeError"] != null) %>
    <%{%>
    <h2 class="field-validation-error">
        <%=Html.Encode(TempData["MensajeError"])%>
    </h2>
    <%}%>
    <% var id = Convert.ToDecimal(Html.ViewData["idperfil"]); %>
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
            </th>
            <th>
                Estado
            </th>
            <th>
                <%=Html.Encode("Opci�n")%>
            </th>
            <th>
                <%=Html.Encode("Descripci�n Opci�n")%>
            </th>
            <th>
                <%=Html.Encode("M�dulo")%>
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
                <%}%>
                <td>
                    <%=Html.ButtonLinkIcon(Url.Action("QuitarPerfilPermiso", "Permisos", new { idPermiso = item.Permiso.Id, idPerfil = ViewData["idperfil"] }), "Quitar", Iconos.circle_close, IconPosition.solo, new { title = "Quitar Permiso" })%>
                    
                    <%if (item.Estado)
                      { %>
                        <%=Html.ButtonLinkIcon(Url.Action("EstadoPermiso", "Permisos", new { idPerfilPermiso = item.Id, idPerfil = ViewData["idperfil"] }), "Estado", Iconos.circle_minus, IconPosition.solo, new { title = "Desactivar Permiso" })%>
                    <%}
                      else
                      { %>
                        <%=Html.ButtonLinkIcon(Url.Action("EstadoPermiso", "Permisos", new { idPerfilPermiso = item.Id, idPerfil = ViewData["idperfil"] }), "Estado", Iconos.circle_check, IconPosition.solo, new { title = "Activar Permiso" })%>
                    <%} %>
                    
                    
                </td>
                <td>
                    <%= Html.Encode(item.Estado.toEstado()) %>
                </td>
                <td>
                    <%= Html.Encode(item.Permiso.Opcion.toOpcion()) %>
                </td>
                <td>
                    <%= Html.Encode(item.Permiso.DescripcionOpcion) %>
                </td>
                <td>
                    <%= Html.Encode(item.Permiso.Modulo.DescripcionOpcion) %>
                </td>
            </tr>
            <% alter = !alter;
       } %>
    </table>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("Lista", "Perfiles", new { id = ViewData["idperfil"] }), "Volver", Iconos.arrow_1_w, IconPosition.left, new {title="Volver a lista de perfiles" })%>
    </p>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("AgregarPermiso", new { id = ViewData["idperfil"] }), "Agregar Permiso a este Perfil", Iconos.circle_plus, IconPosition.right, new { title="Agregar nuevo permiso" })%>
    </p>
    
    <div id="detallePermiso" title ="Detalles Permiso"></div>
    
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
    <%=Html.ImagenFondo("icons", "Lock.png")%>
</asp:Content>