<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Permiso>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Agregar Permiso
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Permisos disponibles</h2>

    <% if (TempData["MensajeError"] != null) %>
    <%{%>
    <h2 class="field-validation-error" >
    <%=Html.Encode(TempData["MensajeError"])%>
    </h2>
    <%} %>    

       <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Mod_Id
            </th>
            <th>
                Opcion
            </th>
            <th>
                DescripcionOpcion
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
                <%= Html.ActionLink("Agregar", "Agregar", new { id=item.Id }) %>
            
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <%= Html.Encode(item.Mod_Id) %>
            </td>
            <td>
                <%= Html.Encode(item.Opcion) %>
            </td>
            <td>
                <%= Html.Encode(item.DescripcionOpcion) %>
            </td>
        </tr>
    
      <% alter = !alter;
       } %>

    </table>
 

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

