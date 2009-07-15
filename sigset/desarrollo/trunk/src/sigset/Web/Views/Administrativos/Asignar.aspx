<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Tecnico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Asignar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista Técnicos</h2>

     <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th></th>
            <th>
                Rut
            </th>
            <th>
                Nombre
            </th>
            <th>
                Nivel
            </th>
            <th>
                Especialidades
            </th>
             <th>
                Ordenes de Trabajo
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
    <%} %>
       
            <th scope="row">
    
                <%= Html.ActionLink("Asignar", "AsignarTecnico", new { rutTecnico = item.Rut, id = TempData["IdOrden"] })%> 
            </th>
            
            <td>
                <%= Html.Encode(String.Format("{0}", item.Rut.GetRutCompleto())) %>
            </td>
            <td>
                <%= Html.Encode( item.Empleado.Nombre + " " ) %>
                <%= Html.Encode(item.Empleado.Apellido_Paterno + " ")%>
                <%= Html.Encode( item.Empleado.Apellido_Materno) %>
                
            </td>
            <td>
                <%= Html.Encode(item.Nivel1.Descripcion)%>
            </td>
             <td>
             <%if (item.Especialidades != null && item.Especialidades.Count > 0)
               { %>
                
                <a href="javascript:VerEspcialidad('<%=item.Rut %>');" >Ver/Cerrar</a>
                <div id="Especialidades<%=item.Rut %>" style="display:none">
                
                <%foreach (var es in item.Especialidades)
                  {%>
                  <br />
                  -<%=es.Tipo_Especialidad1.Descripcion %>
                  
                  <%} %>
                
                </div>
                <%}
               else
               { %>
               Sin Especialidad
              <%} %>

            </td>
           <td>
                Ver Ordenes
           </td>
    </tr>
    
    <% } %>

    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript" language="javascript">
    function VerEspcialidad(idTecnico) {
        $('#Especialidades' + idTecnico).toggle();
    } 
</script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

