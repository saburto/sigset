<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Cliente>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Clientes
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="divContentStyle" runat="server">
    <%=Html.ImagenFondo("icons","Buddy%20Group.png") %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Clientes</h2>
    
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>Editar / Ver</th>
            <th>
                Rut
            </th>
            <th>
                Apellidos / Raz&oacute;n Social
            </th>
            <th>
                Nombre / Sucursal
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
                <%= Html.ButtonLinkIcon(Url.Action("Editar", new { id = item.Id }), "Editar", Iconos.pencil, IconPosition.solo, new { title="Editar información de cliente"})%>
                <%= Html.ButtonLinkIcon(Url.Action("Detalles", new { id = item.Id }), "Ver", Iconos.zoomin, IconPosition.solo, new {title="Ver información de cliente", onclick = "Sys.Mvc.AsyncHyperlink.handleClick(this, new Sys.UI.DomEvent(event), { insertionMode: Sys.Mvc.InsertionMode.replace, httpMethod: 'GET', loadingElementId: 'loadingAjax', updateTargetId: 'detallesCliente', onComplete: Function.createDelegate(this, abrirVentana) });" })%>
            </th>
            <%if (item.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteParticular)
              {%>
                    <td>
                        <%= Html.Encode(item.ClienteParticular.Rut.GetRutCompleto())%>
                    </td>
                    <td>
                        <%= Html.Encode(item.ClienteParticular.ApellidoPaterno)%> <%= Html.Encode(item.ClienteParticular.ApellidoMaterno)%>
                    </td>
                    <td>
                        <%= Html.Encode(item.ClienteParticular.Nombre)%>
                    </td>
            <%}
              else if (item.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteComercial)
              { %>
                    <td>
                        <%= Html.Encode(item.ClienteComercial.Rut.GetRutCompleto())%>
                    </td>
                    <td>
                        <%= Html.Encode(item.ClienteComercial.RazonSocial)%>
                    </td>
                    <td>
                        <%= Html.Encode(item.ClienteComercial.Sucursal)%>
                    </td>            
            <%} %>
            <td>
              <%= Html.ButtonLinkIcon(Url.Action("Crear","OrdenTrabajo", new {id = item.Id }),"Agregar Orden Trabajo",Iconos.circle_plus,IconPosition.solo,new{title="Agregar Nueva Orden de trabajo"})  %>
            </td>
        </tr>
    
    <% } %>      
    </table>
    <%=Html.Paginador() %>
    <p>
        <%=Html.ButtonLinkIcon(Url.Action("Crear"), "Nuevo Cliente", Iconos.circle_plus, IconPosition.left, new {title="Agregar Nuevo Cliente" })%>
    </p>
    
    <div id="detallesCliente" style="display:none" title="Datos Cliente" >
    </div>
    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript">
        $(function() {
            $("#detallesCliente").dialog({
                bgiframe: true,
                modal: true,
                autoOpen: false,
                height: 500,
                width:500

            });
         });
    
    
        function abrirVentana() {
            $('#detallesCliente').dialog('open');
        }

    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

