<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.OrdenTrabajo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Ordenes Asignadas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Ordenes Asignadas</h2>
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                Ver
            </th>
            <th>
                Id
            </th>
            <th>
                Serie
            </th>
            <th>
                Fecha Ingreso
            </th>
            <th>
                Fecha Entrega
            </th>
            <th>
                Tipo Orden
            </th>
            <th>
                Estado
            </th>
        </tr>
    <% foreach (var item in Model)
       { %>
        <tr>
            <th scope="row">
                <%= Html.Hidden("Id" + item.Id, item.Id) %>
                <%= Html.ButtonLinkIcon(Url.Action("Detalles","OrdenTrabajo",new { id=item.Id }), "Detalles", Iconos.zoomin,IconPosition.solo, new{ onclick="return verDetalles(this,"+ item.Id +")" }) %>
            </th>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Id)) %>
            </td>
            <td>
                <%= Html.Encode(item.Serie) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.FechaIngreso)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:d}", item.FechaEntrega)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.TipoOrden1.Descripcion)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Detalles.OrderByDescending(x => x.FechaCreacion).FirstOrDefault() == null ? "" : item.Detalles.OrderByDescending(x => x.FechaCreacion).FirstOrDefault().Estado1.Descripcion))%>
            </td>
        </tr>
        <tr id="fila<%=item.Id %>" class="filaDetalle" style="display:none">
            <td colspan="7">
                <p id="loading<%=item.Id %>">Cargando detalles...</p>
                <div style="font-size:80%" >
                
                <%if (item.EstadoActual().IdEstado == (int)Data.Modelo.Enums.EstadoOrden.Asignado)
                  { %>
                    <%= Html.ButtonLinkIcon("#", "Aceptar", Iconos.check, IconPosition.left, new { title = "Aceptar Orden de trabajo", onclick = "return aceptarOrden('" + item.Id + "')" })%>
                                        <%using (Html.BeginForm("Aceptar", "AreaTecnica", FormMethod.Post, new { id = "formu" + item.Id }))
                                          { %>
                        <%=Html.AntiForgeryToken()%>
                        <input type="hidden" name="Id" value='<%=item.Id %>' />
                    <%} %>
                <%}else{ %>
                    
                    <%= Html.ButtonLinkIcon("#", "Agregar Detalle", Iconos.plus, IconPosition.left, new { title = "Agregar nuevo detalle a Orden de trabajo", onclick = "return abrirIngresoDetalle('" + item.Id + "')" })%>
                    
                    
                    <%} %>
                    <%= Html.ButtonLinkIcon("#", "Rechazar", Iconos.closethick, IconPosition.left, new { title = "Rechazar Orden de trabajo", onclick = "return abrirRechazo('" + item.Id + "')" })%>
                    
                </div>
                <br />
                <br />
                <div id="resultado<%=item.Id %>" style="font-size:1.6em;display:none">
                </div>
            </td>
            
            
        </tr>
    <% } %>
    </table>

<div id="ventanaRechazo" class="ventana" title="Rechazar">
  <%using(Html.BeginForm("Rechazar", "AreaTecnica", FormMethod.Post)) {%>
    
            <label for="Contenido">Causa:</label>
            <%=Html.AntiForgeryToken() %>
            <input  name="IdOrden" value="" type="hidden" />
            <%=Html.TextArea("Contenido", null, new { style="width:100%", rows="8" })%>
  <br />
    
    <%=Html.ButtonSubmit("Guardar") %>
    <%} %>
</div>

<div id="ventanaDetalle" class="ventana" title="Ingresar Detalle">
  <%using (Html.BeginForm("AgregarDetalle", "AreaTecnica", FormMethod.Post))
    {%>
            <%=Html.AntiForgeryToken() %>
            <input name="IdOrden" value="" type="hidden" />
            
            <label for="Estado">Estado:</label>
            <%=Html.ListaEstadosTecnicos("Estado")%>
            <label for="Contenido">Contenido:</label>
            <%=Html.TextArea("Contenido", null, new { style="width:100%;", rows="8" })%>
  <br />
    
    <%=Html.ButtonSubmit("Guardar") %>
    <%} %>
</div>


    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
    
    .ui-dialog
    {
        font-size:70%
    }


</style>


<script type="text/javascript">
//<![CDATA[

    function aceptarOrden(id) {
        $("#formu" + id).submit();
        return false;
    }

    function abrirRechazo(id) {
        var $ventana = $("#ventanaRechazo");
        abrirVentana($ventana, id);
    }

    function abrirIngresoDetalle(id) {
        var $ventana = $("#ventanaDetalle");
        abrirVentana($ventana, id);
    }

    function abrirVentana($ventana, id) {
        $ventana.find(":input[name='IdOrden']").val(id);
        $ventana.find(":input[name='Contenido']").val("");
        $ventana.dialog('open');
    }

    $(function() {

    $(".ventana").dialog({
            autoOpen : false,
            width: 500,
            height:280
        });

    });
    
//]]>
</script>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
