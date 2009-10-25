<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.OrdenTrabajo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	OrdenesTecnico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Ordenes Tecnico
    <%if (Model.FirstOrDefault() != null)
	{%>
     <%=string.Format("{0} {1}",Model.FirstOrDefault().Tecnico.Empleado.Nombre,Model.FirstOrDefault().Tecnico.Empleado.Apellido_Paterno) %>
    <%} %>
    </h2>
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
                <%= Html.ActionLink("Asginar", "Asignar", new { id=item.Id })%> |
                <%= Html.ActionLink("Detalles", "Detalles","OrdenTrabajo",new { id=item.Id }, null)%>
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

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

