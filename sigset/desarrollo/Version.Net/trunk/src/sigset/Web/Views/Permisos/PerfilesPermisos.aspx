<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.PerfilPermiso>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Permisos del perfil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <h2>Permisos del Perfil <%=Html.ViewData["perfil"] %>  </h2>
   
    <% if (TempData["MensajeError"] != null) %>
    <%{%>
     <h2 class ="field-validation-error" >
        <%=Html.Encode(TempData["MensajeError"])%>
     </h2>
    <%}%>
    

     <table border="0" cellpadding="0" cellspacing="0" class="data-table">
       <tr>
            <th></th>
            <th>
                Id
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
                <%= Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
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

    <p>
        <%= Html.ActionLink("Agregar Permiso a este Perfil", "AgregarPermiso",new { id =  Html.ViewData["idperfil"] })%>
    </p>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>


