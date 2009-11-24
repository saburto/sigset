<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Data.Modelo.Usuario>>" %>

<table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                Editar
            </th>
            <th>
                Eliminar
            </th>
            <th>
                Nombres
            </th>
            <th>
                Apellidos
            </th>
            <th>
                Usuario
            </th>
            <th>
                Perfil
            </th>
            <th>
                Email
            </th>
            <th>
                 <%=Html.Encode("Teléfono") %>
            </th>
            <th>
                Estado
            </th>
            <th>
                Permisos
            </th>
        </tr>
    <%bool alter = false; %>
    <% foreach (var item in Model)
       {
            if (item.Id == Data.Modelo.Constantes.Constantes.ID_USUARIO_SISTEMA){ continue;}
    %>
    <%if (alter)
      { %>
        <tr class="row-alternating">
    <%}
      else
      { %>
        <tr>
    <%} alter = !alter; %>
            <%if (item.Id != Data.Modelo.Constantes.Constantes.ID_USUARIO_SISTEMA)
              { %>
                <th scope="row">
                    <%= Html.ButtonLinkIcon(Url.Action("Editar", new { id = item.Id }), "Editar", Iconos.pencil, IconPosition.solo, new { title = "Editar Usuario" })%> 
                </th>
                <th scope="row">
                    <%= Html.ButtonLinkIcon(Url.Action("Eliminar", new { id = item.Id }), "Eliminar", Iconos.trash, IconPosition.solo, new { onclick = "return eliminar(this);", title = "Eliminar Usuario" })%>
                </th>
            <%}
              else
              { %>
                <th></th><th></th>
            <%} %>
            <td>
                <%= Html.Encode(item.Nombres) %>
            </td>
            <td>
                <%= Html.Encode(string.Format("{0} {1}", item.ApellidoPaterno, item.ApellidoMaterno)) %>
            </td>
            <td>
                <%= Html.Encode(item.User) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Perfil != null ? item.Perfil.Descripcion : "")) %>
            </td>
            <td>
                <%=string.Format("<a href='mailto:{0}'>{0}</a>", Html.AttributeEncode(item.Email))%>
            </td>
            <td>
                <%= Html.Encode(item.Telefono) %>
            </td>
            <td>
                <%= Html.Encode(item.Activo ? "Activo":"Desactivado") %>
            </td>
            <th scope="row">
               <%if (item.Id != Data.Modelo.Constantes.Constantes.ID_USUARIO_SISTEMA)
                 { %>
                <%= Html.ButtonLinkIcon(Url.Action("AgregarPermisoUsuario", "Permisos", new { idUsuario = item.Id }), "Permisos", Iconos.locked, IconPosition.solo, new { title = "Permisos Usuario" })%>
                <%} %>
            </th>
        </tr>
    
    <% } %>

</table>
<script type="text/javascript" language="javascript">
//<![CDATA[

        function eliminar(a) {
            if (confirm("Esta Seguro de eliminar este elemento")) {
                location.href = a.href;
            }
            return false;
        }
        
//]]>        
</script>