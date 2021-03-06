<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Data.Modelo.OrdenTrabajo>>" %>
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th></th>
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
            <th>
                <%=Html.Encode("T�cnico") %>
            </th>
            <th></th>
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
            <td class="tecnicoAsignado" id="<%=item.Id %>" >
                <%if (item.Tecnico != null)
                  { %>
                <%= Html.Encode(item.Tecnico.Usuario.NombreCompleto) %>
                <%}
                  else
                  { %>
                    Sin <%=Html.Encode("T�cnico") %> asignado
                <%} %>
            </td>
            <td>
                <%if (item.Tecnico != null)
                  { %>
                    <%=Html.ImagenUsuario(item.Tecnico.Usuario.User, "imagenUsuario", "Tecnico", null)%>
                <%}%>
            </td>
        </tr>
        <tr id="fila<%=item.Id %>" class="filaDetalle" style="display:none">
            <td colspan="9">
                <p id="loading<%=item.Id %>">Cargando detalles...</p>
                <div style="font-size:53%" >
                    <%= Html.ButtonLinkIcon(Url.Action("Detalles", "OrdenTrabajo", new { id = item.Id }), "Detalles", Iconos.newwin, IconPosition.solo, new { title = "Abrir en nueva ventana", target = "_blank" })%>
                </div>
                <br />
                <div id="resultado<%=item.Id %>" style="font-size:1.6em;display:none">
                </div>
            </td>
            
            
        </tr>
    <% } %>
    </table>
