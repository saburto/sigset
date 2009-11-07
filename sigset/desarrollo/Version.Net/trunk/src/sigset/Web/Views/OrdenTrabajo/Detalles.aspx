<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.OrdenTrabajo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detalles
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="no-print" style="float:right;font-size:53%">
    <%=Html.ButtonLinkIcon("javascript:window.print()", "Imprimir", Iconos.print, IconPosition.left, new{ title="Imprimir Pagina web"}) %>
    <%=Html.ButtonLinkIcon(Url.Action("Detalles",new {id=Model.Id,format="pdf"} ), "Pdf", Iconos.document, IconPosition.left, new{ title="Exportar a pdf"}) %>
    <%=Html.ButtonLinkIcon(Url.Action("Detalles",new {id=Model.Id,format="excel"} ), "Excel", Iconos.calculator, IconPosition.left, new{ title="Exportar a excel"}) %>
</div>   
<br /> 

<%Html.RenderPartial("DetallesOrden", Model); %>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
