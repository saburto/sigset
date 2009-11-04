<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Usuario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ContentPlaceHolderID="divContentStyle" runat="server">
    <%=Html.ImagenFondo("icons","Buddy%20Group.png") %>
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
                Telefono
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
                <%= Html.ButtonLinkIcon(Url.Action("Editar", new { id = item.Id }), "Editar", Iconos.pencil, IconPosition.solo, new { title="Editar Usuario" })%> 
            </th>
            <th scope="row">
                <%= Html.ButtonLinkIcon(Url.Action("Eliminar", new { id = item.Id }), "Eliminar", Iconos.trash, IconPosition.solo, new { onclick = "return eliminar(this);", title="Eliminar Usuario" })%>
            </th>
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
                <%= Html.ButtonLinkIcon(Url.Action("AgregarPermisoUsuario","Permisos", new { idUsuario = item.Id }), "Permisos", Iconos.locked, IconPosition.solo, new { title="Permisos Usuario" })%>
            </th>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%=Html.ButtonLinkIcon(Url.Action("Crear"),"Crear Nuevo",Iconos.circle_plus) %>
    </p>
</asp:Content>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript">
        function eliminar(a) {
            if (confirm("Esta Seguro de eliminar este elemento")) {
                location.href = a.href;
            }
            return false;
        }
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

