<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Listar
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

    $('#Fecha_Inicio').datepicker();
    $('#Fecha_Final').datepicker();
    
    $('#submitLista').click(
    function()
    {
        var final = $("#excelLink").attr("href").indexOf("?")
        var link = $("#excelLink").attr("href").substring(0,final) + "?format=xls&Fecha_Inicio=" + $('#Fecha_Inicio').val() + "&Fecha_Final=" + $('#Fecha_Final').val() + "&ListaTipos=" + $('#ListaTipos').val() + "&ListaEstados="+ $('#ListaEstados').val();
        $("#excelLink").attr("href", link);
    }
    );

<%} %>
  //]]>
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Listar Ordenes de Trabajo</h2>
    <%using(Ajax.BeginForm(new AjaxOptions{ UpdateTargetId="resultados", HttpMethod="POST", LoadingElementId="loadingAjax"})) {%>
    <fieldset>
    <div class="three-column-container">
      <div class="three-column-left">
    <label for="Fecha_Inicio">Rango de Fecha:</label>
    <%=Html.TextBox("Fecha_Inicio") %> 
        </div>
        <div class="three-column-middle">
    <label for="Fecha_Final">hasta:</label>
    <%=Html.TextBox("Fecha_Final") %>
    </div>
    </div>
    
    <br /><br />
    
    <div class="three-column-container">
      <div class="three-column-left">    
    <label for="ListaTipos">Tipos de Orden</label>
    <%=Html.DropDownList("ListaTipos")%>
    </div>
    
    <div class="three-column-middle">
    <label for="ListaEstados">Estados de Orden</label>
    <%=Html.DropDownList("ListaEstados")%>
    </div>
    </div>
    <div class="clear"></div>
    <br /><br />
    <input type="submit" value="Listar" id="submitLista" />
    
    </fieldset>
    <%} %>
    <div id="resultados"></div>

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
<ul>
<li>
<%=Html.ActionLink("Exportar a Excel", "ListarExcel", new { format = "xls" }, new {id="excelLink"})%>
</li>
</ul>
</asp:Content>

