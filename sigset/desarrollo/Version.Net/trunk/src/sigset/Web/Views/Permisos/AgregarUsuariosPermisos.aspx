<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Permiso>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Agregar Usuarios Permisos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Agregar Usuarios Permisos</h2>
    <% if (TempData["MensajeError"] != null) %>
    <%{%>
    <h2 class="field-validation-error">
        <%=Html.Encode(TempData["MensajeError"])%>
    </h2>
    <%} %>
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                Agregar
            </th>
            <th>
                <%=Html.Encode("M�dulo") %>
            </th>
            <th>
                <%=Html.Encode("Opci�n") %>
            </th>
            <th>
                <%=Html.Encode("Descripci�n Opci�n") %>
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
                    <%=Html.ButtonLinkIcon(Url.Action("AgregarUsuarioPermiso", "Permisos", new { idPermiso = item.Id, idUsuario = ViewData["idUsuario"] }), "Agregar", Iconos.circle_plus, IconPosition.solo, new {title="Agregar" })%>
                </td>
                <td>
                    <%= Html.Encode(item.Modulo.DescripcionOpcion) %>
                </td>
                <td>
                    <%= Html.Encode(item.Opcion.toOpcion()) %>
                </td>
                <td>
                    <%= Html.Encode(item.DescripcionOpcion) %>
                </td>
            </tr>
            <% alter = !alter;
           } %>
    </table>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("AgregarPermisoUsuario", "Permisos", new { idUsuario = ViewData["idUsuario"] }), "Volver", Iconos.arrow_1_w, IconPosition.left, null)%>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
    <%=Html.ImagenFondo("icons", "Lock.png")%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
