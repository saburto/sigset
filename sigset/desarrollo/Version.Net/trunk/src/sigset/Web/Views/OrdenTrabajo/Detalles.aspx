<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.OrdenTrabajo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detalles
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%Html.RenderPartial("DetallesOrden", Model); %>
    <ul>
        <li><a href="javascript:window.print()">Imprimir</a></li>
        <li>
            <%=Html.ActionLink("Exportar a Excel","Detalles",new {id=Model.Id,format="excel"}) %>
        </li>
        <li>
            <%=Html.ActionLink("Exportar a PDF","Detalles",new {id=Model.Id,format="pdf"}) %>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
