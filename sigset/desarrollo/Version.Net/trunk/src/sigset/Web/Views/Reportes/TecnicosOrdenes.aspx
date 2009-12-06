<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reporte de ordenes por técnico
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">
    //<![CDATA[
<%using (Html.BeginReady())
  {%>

    $.datepicker.setDefaults({
        constrainInput: true,
        dateFormat: 'dd-mm-yy',
 		closeText: 'Cerrar',
		prevText: '&#x3c;Ant',
		nextText: 'Sig&#x3e;',
		currentText: 'Hoy',
		monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
		'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
		monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
		'Jul','Ago','Sep','Oct','Nov','Dic'],
		dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
		dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
		dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
        firstDay: 1,
		isRTL: false,
		showButtonPanel: true
    });

    $('#fechaInicio').datepicker();
    $('#fechaFin').datepicker();
    


<%} %>
  //]]>
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        
    <h2>Reporte de ordenes de trabajo</h2>
    
    <%using (Ajax.BeginForm("ReporteTecnicosOrden", new AjaxOptions { UpdateTargetId = "resultados", HttpMethod = "POST", LoadingElementId = "loadingAjax" }))
      {%>
    <fieldset>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Fecha_Inicio">
                    Rango de Fecha:</label>
                <%=Html.TextBox("fechaInicio", null, new { title = "Fecha mínima en que se ingreso la orden de trabajo" })%>
            </div>
            <div class="three-column-middle">
                <label for="Fecha_Final">
                    Hasta:</label>
                <%=Html.TextBox("fechaFin", null, new { title = "Fecha máxima en que se ingreso la orden de trabajo" })%>
            </div>
        </div>
        <br />
        <br />
        <div class="three-column-container">
            <div class="three-column-middle">
                <label for="ListaEstados">
                    Estados de Orden</label>
                <%=Html.DropDownList("tipoEstado")%>
            </div>
        </div>
        <div class="clear">
        </div>
        <br />
        <br />
    </fieldset>
    <%=Html.ButtonSubmit("Generar Informe", new { id = "submitLista" })%>
    <%} %>
    <br />
    <div id="resultados">
    </div>
</asp:Content>
