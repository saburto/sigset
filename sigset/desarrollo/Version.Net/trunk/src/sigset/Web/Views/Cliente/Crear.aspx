<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Crear Cliente
</asp:Content>
<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%using (Html.BeginReady())
      {%>
    <%= Html.InitializeAutoComplete("Region", "EncontrarRegiones", "Cliente", true,15) %>
    <%= Html.InitializeAutoComplete("Provincia", "EncontrarProvincias", "Cliente", true, "Region", 30, 0) %>
    <%= Html.InitializeAutoComplete("Comuna", "EncontrarComunas", "Cliente", true, "Provincia",100,0 ) %>
    <%} %>

    <script type="text/javascript">
        $(function() {
        $(":radio[name='TipoCliente']").click(function() {

                switch ($(this).val()) {
                    case "0":
                        {
                            $("#datosParticular").show();
                            $("#datosComercial").hide();
                            break;
                        }
                    case "1":
                        {
                            $("#datosParticular").hide();
                            $("#datosComercial").show();
                            
                            break;
                        }
                }
            });
        });
    </script>

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
            </div>
            <div class="three-column-middle">
                <label for="particular" style="display: inline !important">
                    Particular:
                </label>
                <input type="radio" name="TipoCliente" checked="checked" id="particular" value="0" />
                <label for="comercial" style="display: inline !important">
                    Comercial:
                </label>
                <input type="radio" name="TipoCliente" id="comercial" value="1" />
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="three-column-container" id="datosParticular">
            <div class="three-column-left">
                <label for="Nombre">
                    Nombre:</label>
                <%= Html.TextBox("ClienteParticular.Nombre")%>
                <%= Html.ValidationMessage("ClienteParticular.Nombre", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="ApellidoPaterno">
                    Apellido Paterno:</label>
                <%= Html.TextBox("ClienteParticular.ApellidoPaterno")%>
                <%= Html.ValidationMessage("ClienteParticular.ApellidoPaterno", "*")%>
            </div>
            <div class="three-column-right">
                <label for="ApellidoMaterno">
                    Apellido Materno:</label>
                <%= Html.TextBox("ClienteParticular.ApellidoMaterno")%>
                <%= Html.ValidationMessage("ClienteParticular.ApellidoMaterno", "*")%>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="three-column-container" id="datosComercial" style="display: none">
            <div class="three-column-left">
                <label for="RazonSocial">
                    Raz&oacute;n Social:</label>
                <%= Html.TextBox("ClienteComercial.RazonSocial")%>
                <%= Html.ValidationMessage("ClienteComercial.RazonSocial", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="ApellidoPaterno">
                    Sucursal:</label>
                <%= Html.TextBox("ClienteComercial.RazonSocial")%>
                <%= Html.ValidationMessage("ClienteComercial.RazonSocial", "*")%>
            </div>
            <div class="clear">
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>
            <%=Html.Encode("Dirección")%></legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Calle">
                    Calle:</label>
                <%= Html.TextBox("Calle")%>
                <%= Html.ValidationMessage("Calle", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="Numero">
                    <%=Html.Encode("Número:") %></label>
                <%= Html.TextBox("Numero")%>
                <%= Html.ValidationMessage("Numero", "*")%>
            </div>
        </div>
        <br />
        <br />
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Region">
                    <%=Html.Encode("Region:")%></label>
                <%= Html.AutoCompleteTextBox("Region")%>
                <%= Html.ValidationMessage("Region", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="Provincia">
                    Provincia:</label>
                <%= Html.AutoCompleteTextBox("Provincia")%>
                <%= Html.ValidationMessage("Provincia", "*")%>
            </div>
            <div class="three-column-right">
                <label for="Comuna">
                    Comuna:</label>
                <%= Html.AutoCompleteTextBox("Comuna")%>
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
                    <%=Html.Encode("Correo Electrónico:") %></label>
                <%= Html.TextBox("Email.ValorContacto", null, new { Class="email" })%>
                <%= Html.ValidationMessage("Email.ValorContacto", "*") %>
            </div>
            <div class="three-column-middle">
                <label for="Valor_Contacto">
                    <%=Html.Encode("Teléfono:") %></label>
                <%= Html.TextBox("Fono.ValorContacto") %>
                <%= Html.ValidationMessage("Fono.ValorContacto", "*") %>
            </div>
        </div>
        <div class="clear">
        </div>
        <br />
    </fieldset>
    <p>
        <%=Html.ButtonSubmit("Grabar") %>
    </p>
    <% } %>
    
    <%=Html.ClientSideValidation("",typeof(Data.Modelo.Cliente)) %>
    <%=Html.ClientSideValidation("",typeof(Data.Modelo.Direccion)) %>
    <%=Html.ClientSideValidation("Email", typeof(Data.Modelo.Contacto))%>
    <%=Html.ClientSideValidation("Fono",typeof(Data.Modelo.Contacto)) %>
    <%=Html.ClientSideValidation("ClienteParticular", typeof(Data.Modelo.ClienteParticular))%>
    <%=Html.ClientSideValidation("ClienteComercial", typeof(Data.Modelo.ClienteComercial))%>
    
</asp:Content>
