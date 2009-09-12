<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Data.Modelo.Orden_Trabajo>>" %>

    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Rut
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
    
        <tr>
            <th scope="row">
                <%= Html.ActionLink("Detalles", "Detalles", new { id=item.Id })%>
            </th>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Id)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Id_Cliente.GetRutCompleto())) %>
            </td>
            <td>
                <%= Html.Encode(item.Serie) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.Fecha_Ingreso)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:d}", item.Fecha_Entrega)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Tipo_Orden1.Descripcion)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Detalles.OrderByDescending(x => x.Fecha_Creacion).FirstOrDefault() == null ? "" : item.Detalles.OrderByDescending(x => x.Fecha_Creacion).FirstOrDefault().Estado1.Descripcion))%>
            </td>

        </tr>
    
    <% } %>
    </table>

