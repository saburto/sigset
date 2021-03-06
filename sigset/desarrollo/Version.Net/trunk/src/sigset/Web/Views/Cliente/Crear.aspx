<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Crear Cliente
</asp:Content>
<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
//<![CDATA[

    <%using (Html.BeginReady())
      {%>
    <%= Html.InitializeAutoComplete("Region", "EncontrarRegiones", "Cliente", true,15) %>
    <%= Html.InitializeAutoComplete("Provincia", "EncontrarProvincias", "Cliente", true, "Region", 30, 0) %>
    <%= Html.InitializeAutoComplete("Comuna", "EncontrarComunas", "Cliente", true, "Provincia",100,0 ) %>
    <%} %>

    
    
        $(function() {

        $("#resultado").dialog({
            bgiframe: true,
            modal: true,
            autoOpen: false,
            height: 500,
            width: 500

        });

        $("#datosParticular input").removeAttr("disabled");
        $("#datosComercial input").attr("disabled", "disabled");
        
        
        $(":radio[name='TipoCliente']").click(function() {

                switch ($(this).val()) {
                    case "1":
                        {
                            $("#datosParticular").show();
                            $("#datosComercial").hide();

                            $("#datosParticular input").removeAttr("disabled");
                            $("#datosComercial input").attr("disabled", "disabled");
                            
                            break;
                        }
                    case "2":
                        {
                            $("#datosParticular").hide();
                            $("#datosComercial").show();

                            $("#datosComercial input").removeAttr("disabled");
                            $("#datosParticular input").attr("disabled", "disabled");
                            break;
                        }
                }
            });
        });


        function buscarCliente(link) {
            if ($("#RutDisplay").valid()) {

                $("#loadingAjax").show();
                $("#resultado").load(link.href, $("#RutDisplay"), abrirVentana);
            }
            return false;
        }

        function abrirVentana() {
            $("#loadingAjax").hide();
            $('#resultado').dialog('open');
        }
        
//]]>        
    </script>
    <style type="text/css">
        #RutDisplay, #Rut, #dv
        {
            display:inline !important;
        }
    
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.ValidationSummary("Favor corregir los siguientes errores.") %>
    <% using (Html.BeginForm("Crear", "Cliente"))
       {%>
    <fieldset>
        <legend>Nuevo Cliente</legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Rut">
                    Rut:</label>
                <%= Html.RutTextBox() %>
            
                    <%= Html.ValidationMessage("Rut", "*")%>
                    <div style="font-size:50%; display:inline !important; float:right;width:46%;position:relative;">
                    <%= Html.ButtonLinkIcon(Url.Action("Buscar"), "Buscar", Iconos.search, IconPosition.solo, new { onclick = "return buscarCliente(this)", title="Buscar si cliente existe por rut" })%>
                    </div>
            
            </div>
            
            <div class="three-column-middle">
                <label for="particular" style="display: inline !important">
                    Particular:
                </label>
                <input type="radio" name="TipoCliente" checked="checked" id="particular" value="1" title="Opci�n para ingresar datos de cliente particular" />
                <label for="comercial" style="display: inline !important">
                    Comercial:
                </label>
                <input type="radio" name="TipoCliente" id="comercial" value="2"  title="Opci�n para ingresar datos de cliente comercial" />
            </div>
            <div class="clear"></div>
        </div>
        <div class="three-column-container" id="datosParticular">
            <div class="three-column-left">
                <label for="Nombre">
                    Nombre:</label>
                <%= Html.TextBox("ClienteParticular.Nombre", null, new { title="Nombre de cliente" })%>
                <%= Html.ValidationMessage("ClienteParticular.Nombre", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="ApellidoPaterno">
                    Apellido Paterno:</label>
                <%= Html.TextBox("ClienteParticular.ApellidoPaterno", null, new { title="Apellido paterno de cliente" })%>
                <%= Html.ValidationMessage("ClienteParticular.ApellidoPaterno", "*")%>
            </div>
            <div class="three-column-right">
                <label for="ApellidoMaterno">
                    Apellido Materno:</label>
                <%= Html.TextBox("ClienteParticular.ApellidoMaterno", null, new { title = "Apellido materno de cliente" })%>
                <%= Html.ValidationMessage("ClienteParticular.ApellidoMaterno", "*")%>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="three-column-container" id="datosComercial" style="display: none">
            <div class="three-column-left">
                <label for="ClienteComercial.RazonSocial">
                    Raz&oacute;n Social:</label>
                <%= Html.TextBox("ClienteComercial.RazonSocial", null, new { title="Nombre o raz�n social de la empresa" })%>
                <%= Html.ValidationMessage("ClienteComercial.RazonSocial", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="ClienteComercial.Sucursal">
                    Sucursal:</label>
                <%= Html.TextBox("ClienteComercial.Sucursal", null, new { title="Sucursal de la empresa si la tuviese" })%>
                <%= Html.ValidationMessage("ClienteComercial.Sucursal", "*")%>
            </div>
            <div class="clear">
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>
            <%=Html.Encode("Direcci�n")%></legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Calle">
                    Calle:</label>
                <%= Html.TextBox("Calle", null, new { title="Nombre de Calle de Cliente"})%>
                <%= Html.ValidationMessage("Calle", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="Numero">
                    <%=Html.Encode("N�mero:") %></label>
                <%= Html.TextBox("Numero", null, new { title="N�mero de domicilio de Cliente" })%>
                <%= Html.ValidationMessage("Numero", "*")%>
            </div>
        </div>
        <br />
        <br />
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Region">
                    <%=Html.Encode("Regi�n:")%></label>
                <%= Html.AutoCompleteTextBox("Region", new { title="Regi�n de direcci�n del cliente" })%>
                <%= Html.ValidationMessage("Region", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="Provincia">
                    Provincia:</label>
                <%= Html.AutoCompleteTextBox("Provincia", new { title = "Provincia de direcci�n del cliente" })%>
                <%= Html.ValidationMessage("Provincia", "*")%>
            </div>
            <div class="three-column-right">
                <label for="Comuna">
                    Comuna:</label>
                <%= Html.AutoCompleteTextBox("Comuna", new { title = "Comuna de direcci�n del cliente" })%>
                <%= Html.ValidationMessage("Comuna", "*")%>
            </div>
            <div class="clear">
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>Contacto</legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Valor_Contacto">
                    <%=Html.Encode("Correo Electr�nico:") %></label>
                <%= Html.TextBox("Email.ValorContacto", null, new { Class="email", title="Correo electr�nico de cliente para se notificado" })%>
                <%= Html.ValidationMessage("Email.ValorContacto", "*") %>
            </div>
            <div class="three-column-middle">
                <label for="Valor_Contacto">
                    <%=Html.Encode("Tel�fono:") %></label>
                <%= Html.TextBox("Fono.ValorContacto", null, new { title="Tel�fono de contacto de cliente para ser notificado", Class="required" })%>
                <%= Html.ValidationMessage("Fono.ValorContacto", "*") %>
            </div>
        </div>
        <div class="clear">
        </div>
        <br />
    </fieldset>
    <fieldset>
        <legend>Observaciones</legend>
        <%=Html.TextArea("Observacion", new { style = "width: 100%", title="Informaci�n adicional de cliente"})%>
        <br />
        <br />
    </fieldset>
    <p>
        <%=Html.ButtonSubmit("Grabar") %>
    </p>
    <% } %>
    
    <%=Html.ClientSideValidation("", typeof(Data.Modelo.Cliente)).AddRule("Rut", new xVal.Rules.RemoteRule(Url.Action("RutExiste")))%>
    <%=Html.ClientSideValidation("",typeof(Data.Modelo.Direccion)) %>
    <%=Html.ClientSideValidation("Email", typeof(Data.Modelo.Contacto))%>
    <%=Html.ClientSideValidation("Fono",typeof(Data.Modelo.Contacto)) %>
    <%=Html.ClientSideValidation("ClienteParticular", typeof(Data.Modelo.ClienteParticular)) %>
    <%=Html.ClientSideValidation("ClienteComercial", typeof(Data.Modelo.ClienteComercial))%>
    
    <div id="resultado"  style="display:none" title="Resultado"></div>
</asp:Content>
