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
    <%} %>
       
            <th scope="row">
                <%= Html.ActionLink("Eliminar", "Eliminar", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Tipo_Especialidad1.Descripcion) %>
            </td>
            
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Agregar Nueva Especialidad", "AgregarNuevaEspecialidad") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

