<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Web.ViewModel.PermisosUsuariosView>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Agregar Permiso Usuario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Agregar Permiso Usuario</h2>

        <legend>Permisos del perfil</legend>
        <table border="0" cellpadding="0" cellspacing="0" class="data-table">
            <tr>
                <th>
                    Id Perfil
                </th>
                <th>
                    <%=Html.Encode("Descripción opción") %>
                </th>
                <th>
                    <%=Html.Encode("Módulo") %>
                </th>
            </tr>
            <%if (Model.ListaPerfilPermiso != null) %>
                    <%{%>
                    <%bool alter = false; %>
                    <%foreach (var item in Model.ListaPerfilPermiso) { %>
                      <%if (alter)
                        { %>
                       <tr class="row-alternating">
                       <%}
                     else
                          { %>
                           <tr>
                            <%} alter = !alter; %>
                            <td>
                                <%= Html.Encode(item.IdPerfil) %>
                            </td>
                            <td>
                                <%= Html.Encode(item.Permiso.DescripcionOpcion) %>
                            </td>
                            <td>
                                <%= Html.Encode(item.Permiso.Modulo.NombreModulo) %>
                            </td>
                         <%}
                          alter = !alter; %>
                       <%}%>
                           
                      <%else %>
                            <%{%>
                            No hay permisos asociados al perfil
                   <%}%>
                </tr>
        </table>
        
        
          <legend>Otros Permisos</legend>
            <table border="0" cellpadding="0" cellspacing="0" class="data-table">
            <tr>
                <th>
                    IdPermiso
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
                    <%bool alter = false; %>
                    <%foreach (var item in Model.ListaUsuarioPermiso) { %>
                      <%if (alter)
                        { %>
                       <tr class="row-alternating">
                       <%}
                     else
                          { %>
                           <tr>
                            <%} alter = !alter; %>
                            <td>
                                <%= Html.Encode(item.IdPermiso) %>
                            </td>
                            <td>
                                <%= Html.Encode(item.Permiso.DescripcionOpcion) %>
                            </td>
                            <td>
                                <%= Html.Encode(item.Permiso.Modulo.NombreModulo) %>
                            </td>
                         <%}
                          alter = !alter; %>
                       <%}%>
                           
                      <%else %>
                            <%{%>
                            No hay otros permisos asociados al usuario
                   <%}%>
                </tr>
        </table>
         
   
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
