<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Web.ViewModel.PermisosUsuariosView>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Agregar Permiso Usuario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Permisos del usuario</h2>
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
            </th>
            <th>
                <%=Html.Encode("Estado") %>
            </th>
            <th>
                <%=Html.Encode("Opción") %>
            </th>
            <th>
                <%=Html.Encode("Descripción opción") %>
            </th>
            <th>
                <%=Html.Encode("Módulo") %>
            </th>
        </tr>
        <%if (Model.ListaUsuarioPermiso != null && Model.ListaUsuarioPermiso.Count > 0) %>
        <%{%>
        <%foreach (var item in Model.ListaUsuarioPermiso)
          { %>
            <tr>
                <td>
                    <%=Html.ButtonLinkIcon(Url.Action("QuitarUsuarioPermiso", "Permisos", new { idPermiso = item.IdPermiso, idPerfil = ViewData["idperfil"], idUsuario = ViewData["idUsuario"] }), "Quitar", Iconos.circle_close, IconPosition.solo, new { title = "Quitar Permiso" })%>
                    
                    <% if (item.Estado)
                       { %>
                        <%=Html.ButtonLinkIcon(Url.Action("EstadoUsuarioPermiso", "Permisos", new { idPermiso = item.IdPermiso, idUsuario = ViewData["idUsuario"] }), "Estado", Iconos.circle_minus, IconPosition.solo, new { title = "Desactivar Permiso" })%>
                    <%} else { %>
                        <%=Html.ButtonLinkIcon(Url.Action("EstadoUsuarioPermiso", "Permisos", new { idPermiso = item.IdPermiso, idUsuario = ViewData["idUsuario"] }), "Estado", Iconos.circle_check, IconPosition.solo, new { title = "Activar Permiso" })%>
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
                    <%= Html.Encode(item.Permiso.Modulo.NombreModulo) %>
                </td>
                <%} %>
                <%}%>
            </tr>
            <%if (Model.ListaPerfilPermiso != null) %>
            <%{%>
            
            <%            
              foreach (var item in Model.ListaPerfilUsuarioPermiso)
              { %>
                <tr>
                    <td>
                    <%if (item.Estado)
                      { %>
                    
                        <%=Html.ButtonLinkIcon(Url.Action("CambiarEstadoPerfilUsuarioPermiso", "Permisos", new { idPermiso = item.IdPermiso, idUsuario = ViewData["idUsuario"] }), "Estado", Iconos.circle_minus, IconPosition.solo, new { title = "Desactivar Permiso" })%>
                    <%}
                      else
                      { %>
                        <%=Html.ButtonLinkIcon(Url.Action("CambiarEstadoPerfilUsuarioPermiso", "Permisos", new { idPermiso = item.IdPermiso, idUsuario = ViewData["idUsuario"] }), "Estado", Iconos.circle_check, IconPosition.solo, new { title = "Activar Permiso" })%>
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
                        <%= Html.Encode(item.Permiso.Modulo.NombreModulo) %>
                    </td>
                    <%}%>
                    <%}%>
                </tr>
    </table>
    <p style="float: left">
        <%=Html.ButtonLinkIcon("javascript:history.go(-1)", "Volver", Iconos.arrow_1_w, IconPosition.left, new { title = "Volver" })%>
    </p>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("AgregarUsuariosPermisos", "Permisos", new { idUsuario = ViewData["idUsuario"] }), "Agregar Permiso a este Usuario", Iconos.circle_plus, IconPosition.left, null)%>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">

<script type="text/javascript">
    //<![CDATA[

    $(function() {

        $("tr:even").addClass('row-alternating');
    });

//]]>
</script>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
    <%=Html.ImagenFondo("icons", "Lock.png")%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
