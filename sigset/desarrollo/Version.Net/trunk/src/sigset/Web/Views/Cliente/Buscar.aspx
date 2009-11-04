<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Buscar Cliente
</asp:Content>
<asp:Content ID="ContentHead" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.ValidationSummary("Error al buscar.") %>
    <% using (Html.BeginForm("Buscar", "Cliente", FormMethod.Post, new { id = "formBuscar", onsubmit = "return submitBuscar()" }))
       { %>
    <div>
            <fieldset>
            <legend>Buscar Cliente</legend>
            <div class="three-column-container">
            <div class="three-column-left">
                <p>
                    <label for="Rut">Buscar por Rut:</label>
                    <%= Html.RutTextBox()%>
                    <%= Html.ValidationMessage("Rut", "*")%>
                 </p>
            </div>
            <div class="clear"></div>
             </div>
                <p>
                    <%=Html.ButtonSubmit("Buscar")%>
                </p>
                
            </fieldset>
        </div>
    <%} %>
    <p>
    <div id="resultado"  style="display:none" title="Resultado"></div>
    </p>

  
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript">
        $(function() {

        $("#formBuscar").validate();

            $("#resultado").dialog({
                bgiframe: true,
                modal: true,
                autoOpen: false,
                height: 500,
                width: 500

            });
        });

        function submitBuscar() {

            if ($("#formBuscar").valid()) {

                $("#loadingAjax").show();
                $("#resultado").load($("#formBuscar").attr('action'), $("#RutDisplay"), abrirVentana);
            }
            return false;
        }

        function abrirVentana() {
            $("#loadingAjax").hide();
            $('#resultado').dialog('open');
        }

    </script>
</asp:Content>