<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.OrdenTrabajo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detalles
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="no-print" style="float:right;font-size:53%">
    <%=Html.ButtonLinkIcon("javascript:window.print()", "Imprimir", Iconos.print, IconPosition.left, new{ title="Imprimir Página web"}) %>
    <%=Html.ButtonLinkIcon(Url.Action("Detalles",new {id=Model.Id,format="pdf"} ), "Pdf", Iconos.document, IconPosition.left, new{ title="Exportar a pdf"}) %>
    <%=Html.ButtonLinkIcon(Url.Action("Detalles",new {id=Model.Id,format="excel"} ), "Excel", Iconos.calculator, IconPosition.left, new{ title="Exportar a excel"}) %>
</div>   
<br /> 

<%Html.RenderPartial("DetallesOrden", Model); %>

<%if(Model.EstadoActual().IdEstado != (int) Data.Modelo.Enums.EstadoOrden.Entregado){ %>
<div>
    <p>
        <%= Html.ButtonLinkIcon("#", "Agregar Detalle", Iconos.circle_plus, IconPosition.left, new { onclick="return abrirDetalle(this)" })%>
    </p>
</div>
<br />
<div id="divAgregar" style="display:none;">
<% using (Html.BeginForm("AgregarDetalle", "OrdenTrabajo"))
   {%>
        <fieldset>
            <legend>Agregar detalle</legend>
            <p>
                <%=Html.AntiForgeryToken() %>
                <%= Html.Hidden("IdOrden", Model.Id) %>
                <label for="Estado">Estado:</label>
                <%=Html.ListaEstadosRecepcion("Estado", true) %>
            </p>
            <p>
                <label for="Contenido">Contenido:</label>
                <%=Html.TextArea("Contenido", null, new { style="width:100%;", rows="8", @class="required" })%>
                <%= Html.ValidationMessage("Contenido", "*")%>
            </p>
            
        </fieldset>
        <p>
            <%= Html.ButtonSubmit("Guardar") %>
        </p>
<%} %>
</div>
<%} %>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">

<script type="text/javascript">
//<![CDATA[

    function abrirDetalle(boton) {
        $(boton).hide();
        $("#divAgregar").show();
        $("#Estado").focus();
    
        return false;
    }

//]]>
</script>
<%=Html.ClientSideValidation("", typeof(Data.Modelo.Detalle)) %>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
