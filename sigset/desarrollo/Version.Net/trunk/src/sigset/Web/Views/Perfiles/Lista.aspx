<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Perfil>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Perfiles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista</h2>
    <% if (TempData["MensajeError"] != null) %>
    <%{%>
     <h2 class ="field-validation-error" >
        <%=Html.Encode(TempData["MensajeError"])%>
     </h2>
    <%}%>
    

    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                Descripci&oacute;n
            </th>
            <th>Usuarios</th>
            <th>Permisos</th>
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
                <%= Html.Encode(item.Descripcion)%>               
            </td>
            <td>
                <%=Html.ButtonLinkIcon(Url.Action("ListaPerfil","Usuario",new { perfil = item.Id  }),"Usuarios", Iconos.person) %>
            </td>
            <td>
                <%=Html.ButtonLinkIcon(Url.Action("Perfiles","Permisos",new { id = item.Id  }),"Permisos", Iconos.locked) %>
            </td>            
        </tr>
    
    <% alter = !alter;
       } %>

    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

