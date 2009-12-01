<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Articulo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista</h2>

     <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                Editar
            </th>
            <th>
                Modelo
            </th>
            <th>
                Marca
            </th>
            <th>
                Tipo <%=Html.Encode("Artículo")%>
            </th>
            <th>
                <%=Html.Encode("Categoría")%>:
            </th>
            <th>
                Valor Reparaci&oacute;n
            </th>
            <th>
                Valor Revisi&oacute;n
            </th>
            <th>
                <%=Html.Encode("Línea")%>
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
                <%= Html.ButtonLinkIcon(Url.Action("Editar", new { id=item.Id }), "Editar", Iconos.pencil, IconPosition.solo, new { title = "Editar Artículo" })%>
            </td>
            <td>
                <%= Html.Encode(item.Modelo) %>
            </td>
            <td>
                <%= Html.Encode(item.Marca1.Descripcion) %>
            </td>
            <td>
                <%= Html.Encode(item.TipoArticulo1.Descripcion) %>
            </td>
            <td>
                <%= Html.Encode(item.Categoria1.Descripcion) %>
            </td>
            <td>
                <%= Html.Encode(string.Format("{0:c0}", item.PrecioGarantia1.ValorReparacion)) %>
            </td>
            <td>
                <%= Html.Encode(string.Format("{0:c0}",item.PrecioGarantia1.ValorRevision)) %>
            </td>
            
            <td>
                <%= Html.Encode(item.Linea1.Descripcion) %>
            </td>
        </tr>
    
    <% } %>
    </table>
    <%=Html.Paginador() %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

