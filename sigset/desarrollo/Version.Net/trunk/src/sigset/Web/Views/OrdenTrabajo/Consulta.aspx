<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Consulta Orden de Trabajo
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
 <script type="text/javascript">
    //<![CDATA[
<%using (Html.BeginReady())
  {%>

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

    <h2>Consulta</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Ajax.BeginForm("Consulta", new AjaxOptions { HttpMethod="POST", LoadingElementId="loadingAjax", UpdateTargetId="resultado" }))
       {%>

        <fieldset>
            <legend>Consulta Orden de Trabajo</legend>
             <div class="three-column-container">
             <div class="three-column-left">
            <p>
                <label for="Id"><%=Html.Encode("Número de Orden de Trabajo")%></label>
                <%= Html.TextBox("Id")%>
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
            <p>
                <input type="submit" value="Consultar" />
            </p>
        </fieldset>

    <% } %>
    <div id="resultado"></div>

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

