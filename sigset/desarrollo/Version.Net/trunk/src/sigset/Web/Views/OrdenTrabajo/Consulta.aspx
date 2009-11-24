<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Consulta Orden de Trabajo
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
 <script type="text/javascript">
    //<![CDATA[
<%using (Html.BeginReady())
  {%>

      $("#tabs").tabs();

      $('#Id').focus
      (
        function() {
            $('#Id').disabled="";
            $('#Rut').val("");
            $('#Rut').disabled="disabled";
            $('#dv').val("");
            $('#dv').disabled="disabled";
        }
      );
      
      $('#Rut').focus
      (
        function() {
            $('#Rut').disabled="";
            $('#dv').disabled="";
            $('#Id').val("");
            $('#Id').disabled="disabled";
        }
      );

  
  <%} %>
  //]]>
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Consulta Orden de Trabajo</h2>


    <%= Html.ValidationSummary() %>

<div style="font-size:80%">
<div id="tabs">
    <ul>
        <li><a href="#cliente">Por Número Orden y/o Rut</a></li>
        <li><a href="#articulo">Por Artículo</a></li>
    </ul>
    <div id="cliente">
    <% using (Ajax.BeginForm("Consulta", new AjaxOptions { HttpMethod="POST", LoadingElementId="loadingAjax", UpdateTargetId="resultado" }))
       {%>

        <fieldset>
            
             <div class="three-column-container">
             <div class="three-column-left">
            <p>
                <label for="Id"><%=Html.Encode("Número de Orden de Trabajo")%>:</label>
                <%= Html.TextBox("Id", null,new {title="Número de Orden que se desea buscar" })%>
                <%= Html.ValidationMessage("Id", "*")%>
            </p>
            </div>
            <div class="three-column-middle">
            <p>
                <label for="Rut">Rut Cliente:</label>
                <%= Html.RutTextBox()%>
                <%= Html.ValidationMessage("Rut", "*")%>
            </p>
            </div>
            </div>
            <div class="clear"></div>
            
        </fieldset>
        <p>
           <%=Html.ButtonSubmit("Consultar") %>
        </p>

    <% } %>
    </div>
    
    <div id="articulo">
    <% using (Ajax.BeginForm("ConsultaArticulo", new AjaxOptions { HttpMethod="POST", LoadingElementId="loadingAjax", UpdateTargetId="resultado" }))
       {%>

        <fieldset>
             <div class="three-column-container">
             <div class="three-column-left">
            <p>
                <label for="Serie"><%=Html.Encode("Número de Serie de Artículo") %>:</label>
                <%= Html.TextBox("Serie", null,new {title="Número de serie de artículo se desea buscar" })%>
                <%= Html.ValidationMessage("Serie", "*")%>
            </p>
            </div>
            <div class="three-column-middle">
            <p>
                <label for="Modelo">Modelo:</label>
                <%= Html.TextBox("Modelo", null,new {title="Modelo de artículo se desea buscar" })%>
                <%= Html.ValidationMessage("Modelo", "*")%>
            </p>
            </div>
            </div>
            <div class="clear"></div>
            
        </fieldset>
        <p>
           <%=Html.ButtonSubmit("Consultar") %>
        </p>

    <% } %>
    </div>

</div>    
</div>
<br />    
    
    <div id="resultado"></div>


</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

