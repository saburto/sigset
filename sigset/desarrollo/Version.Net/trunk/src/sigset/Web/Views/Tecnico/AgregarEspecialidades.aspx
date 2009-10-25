<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Especialidade>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Especialidades
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
    
    <h2><%=Html.Encode("Detalle especialidades Técnico")%></h2>  
    
  
     <table border="0" cellpadding="0" cellspacing="0" class="data-table">
            <tr>
            <th></th>
            <th>
                Especialidad
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
    <%} alter = !alter;%>
       
            <th scope="row">
                <%= Html.ActionLink("Eliminar", "EliminarEspecialidad", new { id = item.Id, id_tecnico = ViewData["rutTecnico"] })%>
            </td>
            <td>
                <%= Html.Encode(item.TipoEspecialidad1.Descripcion) %>
            </td>
            
        </tr>    
    <% } %>

    </table>

     <p>
        <%= Html.ActionLink("Agregar Nueva Especialidad", "AgregarNuevaEspecialidad", new { id = ViewData["rutTecnico"] })%>
     </p>
     
      <p>
        <%= Html.ActionLink("Volver", "Lista")%>
     </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

