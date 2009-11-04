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
                Id Permiso
            </th>
            <th>
                <%=Html.Encode("Opción")%>
            </th>
            <th>
                <%=Html.Encode("Descripción Opción")%>
            </th>
            <th>
                <%=Html.Encode("Módulo")%>
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
                                          
                    <%=Html.ButtonLinkIcon(Url.Action("DetallesPermisos","Permisos", new { idPermiso = item.Permiso.Id, idPerfil = ViewData["idperfil"] }), "Ver", Iconos.zoomin, IconPosition.solo, new { title = "Detalles Permiso", onclick = "Sys.Mvc.AsyncHyperlink.handleClick(this, new Sys.UI.DomEvent(event), { insertionMode: Sys.Mvc.InsertionMode.replace, httpMethod: 'GET', loadingElementId: 'loadingAjax', updateTargetId: 'detallePermiso', onComplete: Function.createDelegate(this, abrirVentana) });" })%>
                    
                    <%=Html.ButtonLinkIcon(Url.Action("EstadoPermiso", "Permisos", new { idPerfilPermiso = item.Id, idPerfil = ViewData["idperfil"] }), "Estado", Iconos.power, IconPosition.solo, new { title = "Cambiar Estado" })%>
                </td>
                <td>
                    <%= Html.Encode(item.Estado) %>
                </td>
                <td>
                    <%= Html.Encode(item.Permiso.Id) %>
                </td>
                <td>
                    <%= Html.Encode(item.Permiso.Opcion) %>
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
        <%=Html.ButtonLinkIcon(Url.Action("Lista","Perfiles", new { id = ViewData["idperfil"] }), "Volver", Iconos.arrow_1_w, IconPosition.right, null)%>
    </p>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("AgregarPermiso", new { id = ViewData["idperfil"] }), "Agregar Permiso a este Perfil", Iconos.circle_plus, IconPosition.left, null)%>
    </p>
    
    <div id="detallePermiso" title ="Detalles Permiso"></div>
    
</asp:Content>
<asp:Content runat="server" ID="headContent" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript" language="javascript">
        $(function(){
            $("#detallePermiso").dialog({
                bgiframe: true,
                modal: true,
                autoOpen: false,
                height: 400,
                width:500

            });
        
        });
        
          function abrirVentana() {
            $('#detallePermiso').dialog('open');
        }
           
    
    </script>
</asp:Content>



