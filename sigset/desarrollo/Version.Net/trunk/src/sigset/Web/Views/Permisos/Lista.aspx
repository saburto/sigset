<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Permiso>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Permisos del Sistema</h2>

    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                <%=Html.Encode("Módulo") %>
            </th>
            <th>
                <%=Html.Encode("Descripción Opción") %>
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
                    <%= Html.Encode(item.Modulo.DescripcionOpcion) %>
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

