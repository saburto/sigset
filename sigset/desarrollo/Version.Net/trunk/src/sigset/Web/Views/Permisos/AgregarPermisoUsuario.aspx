<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Web.ViewModel.PermisosUsuariosView>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Agregar Permiso Usuario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Agregar Permiso Usuario</h2>
    <legend>Permisos del usuario</legend>
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
            </th>
            <th>
                Id Perfil
            </th>
            <th>
                Id Permiso
            </th>
            <th>
                <%=Html.Encode("Descripción opción") %>
            </th>
            <th>
                <%=Html.Encode("Módulo") %>
            </th>
            <th>
                <%=Html.Encode("Estado") %>
            </th>
        </tr>
        <%if (Model.ListaPerfilPermiso != null) %>
        <%{%>
        <%bool alter = false; %>
        <%foreach (var item in Model.ListaPerfilPermiso)
          { %>
        <%if (alter)
          { %>
        <tr class="row-alternating">
            <%}
          else
          { %>
            <tr>
                <%} alter = !alter; %>
                <td>
                     <%=Html.ButtonLinkIcon(Url.Action("EstadoPermiso", "Permisos", new { idPerfilPermiso = item.Id, idPerfil = ViewData["idperfil"] }), "Estado", Iconos.power, IconPosition.solo, new { title = "Cambiar Estado" })%>
                </td>
                <td>
                    <%= Html.Encode(item.IdPerfil) %>
                </td>
                <td>
                    <%= Html.Encode(item.IdPermiso) %>
                </td>
                <td>
                    <%= Html.Encode(item.Permiso.DescripcionOpcion) %>
                </td>
                <td>
                    <%= Html.Encode(item.Permiso.Modulo.NombreModulo) %>
                </td>
                <td>
                    <%= Html.Encode(item.Estado) %>
                </td>
                <%}
          alter = !alter; %>
                <%}%>
            </tr>
            <%if (Model.ListaUsuarioPermiso != null && Model.ListaUsuarioPermiso.Count > 0) %>
            <%{%>
            <%bool alter = false; %>
            <%foreach (var item in Model.ListaUsuarioPermiso)
              { %>
            <%if (alter)
              { %>
            <tr class="row-alternating">
                <%}
              else
              { %>
                <tr>
                    <%} alter = !alter; %>
                    <td>
                        <%=Html.ButtonLinkIcon(Url.Action("QuitarPerfilPermiso", "Permisos", new { idPermiso = item.Permiso.Id, idPerfil = ViewData["idperfil"] }), "Quitar", Iconos.circle_close, IconPosition.solo, new { title = "Quitar Permiso" })%>
                        <%=Html.ButtonLinkIcon(Url.Action("EstadoPermiso", "Permisos", new { idPerfilPermiso = item.Id, idPerfil = ViewData["idperfil"] }), "Estado", Iconos.power, IconPosition.solo, new { title = "Cambiar Estado" })%>
                    </td>
                    <td>
                      
                    </td>
                    <td>
                        <%= Html.Encode(item.IdPermiso) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Permiso.DescripcionOpcion) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Permiso.Modulo.NombreModulo) %>
                    </td>
                    <td>
                        <%= Html.Encode(item.Estado) %>
                    </td>
                    <%}
              alter = !alter; %>
                    <%}%>
                </tr>
    </table>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("Lista","Perfiles", new { id = ViewData["idperfil"] }), "Volver", Iconos.arrow_1_w, IconPosition.right, null)%>
    </p>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("AgregarUsuariosPermisos", "Permisos", new { idUsuario = ViewData["idUsuario"] }), "Agregar Permiso a este Usuario", Iconos.circle_plus, IconPosition.left, null)%>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
