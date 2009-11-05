<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Articulo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Buscar Articulo
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
//<![CDATA[

    $(function() {

        $("#formBuscarArticulo").validate();

        $("#resultado").dialog({
            bgiframe: true,
            modal: true,
            autoOpen: false,
            height: 300,
            width: 500

        });
    });

    function submitBuscar() {

        if ($("#formBuscarArticulo").valid()) {

            $("#loadingAjax").show();
            $("#resultado").load($("#formBuscarArticulo").attr('action'), $("#formBuscarArticulo input"), abrirVentana);
        }
        return false;
    }

    function abrirVentana() {
        $("#loadingAjax").hide();
        $('#resultado').dialog('open');
    }




//]]>
</script>    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.ValidationSummary("Busca arroja error.") %>

    <% using (Html.BeginForm("Buscar", "Articulo", FormMethod.Post, new { id="formBuscarArticulo", onsubmit = "return submitBuscar()" }))
       {%>

        <fieldset>
            <legend>Buscar Articulo</legend>
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Modelo">Modelo:</label>
                <%= Html.TextBox("Modelo", null, new { @class = "required" })%>
                <%= Html.ValidationMessage("Modelo", "*")%>
                </div>
                <div class="three-column-middle">
                <label for="Modelo">Marca:</label>
                <%= Html.TextBox("Marca", null, new { @class = "required" })%>
                <%= Html.ValidationMessage("Marca", "*")%>
                </div>
            </div>
            <div class="clear"></div>    
            <br />
        </fieldset>
        <br />
        <%=Html.ButtonSubmit("Buscar")%>
    <% } %>
    
    <div id="resultado"  style="display:none" title="Resultado"></div>
   
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

