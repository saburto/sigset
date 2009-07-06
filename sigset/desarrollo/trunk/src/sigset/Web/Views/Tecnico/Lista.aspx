<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Tecnico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista Técnicos Registrados</h2>

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
                <%=Html.Encode("Descripción") +  " " + "nivel" %>
            </th>
        </tr>

    <%bool alter = false; %>
    <% foreach (var item in Model) { %>
        <%if (alter)
        { %>
        <tr class="row-alternating">
       <%}
      else
      { %>
        <tr>
    <%} %>
    
          <td>
                <%= Html.ActionLink("Editar", "Editar", new { id=item.Rut }) %> |
                <%= Html.ActionLink("Detalles", "Detalles", new { id=item.Rut })%>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Rut.GetRutCompleto())) %>
            </td>
            <td>
                <%= Html.Encode( item.Empleado.Nombre + " " ) %>
                <%= Html.Encode(item.Empleado.Apellido_Paterno + " ")%>
                <%= Html.Encode( item.Empleado.Apellido_Materno) %>
                
            </td>
            <td>
                <%= Html.Encode(String.Format("{0}", item.Nivel)) %>
            </td>
            <td>
                <%= Html.Encode(item.Nivel1.Descripcion)%>
            </td>
            
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Crear Nuevo Técnico", "Crear") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

