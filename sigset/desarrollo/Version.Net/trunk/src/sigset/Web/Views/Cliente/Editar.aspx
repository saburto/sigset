<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Cliente>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar Cliente
</asp:Content>
<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%using (Html.BeginReady())
      {%>
    <%= Html.InitializeAutoComplete("Dire.Region", "EncontrarRegiones", "Cliente", true,15) %>
    <%= Html.InitializeAutoComplete("Dire.Provincia", "EncontrarProvincias", "Cliente", true, "Dire.Region", 30, 0) %>
    <%= Html.InitializeAutoComplete("Dire.Comuna", "EncontrarComunas", "Cliente", true, "Dire.Provincia",100,0 ) %>
    <%} %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Editar Cliente</h2>
    <%= Html.ValidationSummary("Edición de cliente con los siguientes errores.") %>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Cliente</legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <p>     
                Rut: <%= Html.Encode(Model.Rut().GetRutCompleto())%>
                </p>
            </div>
            <div class="three-column-middle">
                <%if (Model.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteParticular)
                  { %>
                <p>
                    Cliente Particular
                </p>
                <%}
                  else
                  { %>
                <p>
                    Cliente Comercial
                </p>
                <%} %>
            </div>
            <div class="clear">
            </div>
        </div>
        <%if (Model.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteParticular)
          {%>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Nombre">
                    Nombre:</label>
                <%= Html.TextBox("ClienteParticular.Nombre", Model.ClienteParticular.Nombre, new { title="Nombre de cliente" })%>
                <%= Html.ValidationMessage("ClienteParticular.Nombre", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="ApellidoPaterno">
                    Apellido Paterno:</label>
                <%= Html.TextBox("ClienteParticular.ApellidoPaterno", Model.ClienteParticular.ApellidoPaterno, new { title="Apellido paterno de cliente" })%>
                <%= Html.ValidationMessage("ClienteParticular.ApellidoPaterno", "*")%>
            </div>
            <div class="three-column-right">
                <label for="ApellidoMaterno">
                    Apellido Materno:</label>
                <%= Html.TextBox("ClienteParticular.ApellidoMaterno", Model.ClienteParticular.ApellidoPaterno, new { title = "Apellido materno de cliente" })%>
                <%= Html.ValidationMessage("ClienteParticular.ApellidoMaterno", "*")%>
            </div>
        </div>
        <%}
          else if (Model.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteComercial)
          {%>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="ClienteComercial.RazonSocial">
                    Raz&oacute;n Social:</label>
                <%= Html.TextBox("ClienteComercial.RazonSocial", Model.ClienteComercial.RazonSocial, new { title="Nombre o razón social de la empresa" })%>
                <%= Html.ValidationMessage("ClienteComercial.RazonSocial", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="ClienteComercial.Sucursal">
                    Sucursal:</label>
                <%= Html.TextBox("ClienteComercial.Sucursal", Model.ClienteComercial.Sucursal, new { title="Sucursal de la empresa si la tuviese" })%>
                <%= Html.ValidationMessage("ClienteComercial.Sucursal", "*")%>
            </div>
        </div>
        <%} %>
        <div class="clear">
        </div>
        <br />
    </fieldset>
    <%if (Model.Direccion != null)
      { %>
    <fieldset>
        <legend>
            <%=Html.Encode("Dirección")%></legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Dire.Calle">
                    Calle:</label>
                <%= Html.TextBox("Dire.Calle", Model.Direccion.Calle, new { title="Nombre de Calle de Cliente"})%>
                <%= Html.ValidationMessage("Dire.Calle", "*")%>
                <%= Html.Hidden("Dire.TipoDireccion", Model.Direccion.TipoDireccion)%>
                <%= Html.Hidden("Dire.Id", Model.Direccion.Id)%>
            </div>
            <div class="three-column-middle">
                <label for="Dire.Numero">
                    <%=Html.Encode("Número:") %></label>
                <%= Html.TextBox("Dire.Numero", Model.Direccion.Numero, new { title="Número de domicilio de Cliente" })%>
                <%= Html.ValidationMessage("Dire.Numero", "*")%>
            </div>
        </div>
        <br />
        <br />
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Dire.Region">
                    <%=Html.Encode("Región:")%></label>
                <%if (Model.Direccion.Region1 != null)
                  { %>
                <%= Html.AutoCompleteTextBox("Dire.Region", Model.Direccion.Region1.Nombre, Model.Direccion.Region, new { title="Region de dirección del cliente" } )%>
                <%}
                  else
                  { %>
                <%= Html.AutoCompleteTextBox("Dire.Region", new { title = "Region de dirección del cliente" })%>
                <%} %>
                <%= Html.ValidationMessage("Dire.Region", "*")%>
            </div>
            <div class="three-column-middle">
                <label for="Dire.Provincia">
                    Provincia:</label>
                <%if (Model.Direccion.Provincia1 != null)
                  { %>
                <%= Html.AutoCompleteTextBox("Dire.Provincia", Model.Direccion.Provincia1.nombre, Model.Direccion.Provincia, new { title = "Provincia de dirección del cliente" })%>
                <%}
                  else
                  { %>
                <%= Html.AutoCompleteTextBox("Dire.Provincia")%>
                <%} %>
                <%= Html.ValidationMessage("Dire.Provincia", "*")%>
            </div>
            <div class="three-column-right">
                <label for="Dire.Comuna">
                    Comuna:</label>
                <%if (Model.Direccion.Comuna1 != null)
                  { %>
                <%= Html.AutoCompleteTextBox("Dire.Comuna", Model.Direccion.Comuna1.Nombre, Model.Direccion.Comuna, new { title = "Comuna de dirección del cliente" })%>
                <%}
                  else
                  { %>
                <%= Html.AutoCompleteTextBox("Dire.Comuna")%>
                <%} %>
                <%= Html.ValidationMessage("Dire.Comuna", "*")%>
            </div>
            <div class="clear">
            </div>
        </div>
    </fieldset>
    <%} %>
    <%if (Model.Contactos != null && Model.Contactos.Any())
      { %>
    <fieldset>
        <legend>Contacto</legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <label for="Email.ValorContacto">
                    <%=Html.Encode("Correo Electrónico:") %></label>
                <%= Html.TextBox("Email.ValorContacto", Model.Contactos.Where(x=> x.TipoContacto == 3).FirstOrDefault().ValorContacto)%>
                <%= Html.ValidationMessage("Email.ValorContacto", "*")%>
                <%= Html.Hidden("Email.TipoContacto", Model.Contactos.Where(x => x.TipoContacto == 3).FirstOrDefault().TipoContacto) %>
                <%= Html.Hidden("Email.Id", Model.Contactos.Where(x => x.TipoContacto == 3).FirstOrDefault().Id) %>
            </div>
            <div class="three-column-middle">
                <label for="Fono.ValorContacto">
                    <%=Html.Encode("Teléfono:") %></label>
                <%= Html.TextBox("Fono.ValorContacto", Model.Contactos.Where(x => x.TipoContacto == 1).FirstOrDefault().ValorContacto)%>
                <%= Html.ValidationMessage("Fono.ValorContacto", "*")%>
                <%= Html.Hidden("Fono.TipoContacto", Model.Contactos.Where(x => x.TipoContacto == 1).FirstOrDefault().TipoContacto) %>
                <%= Html.Hidden("Fono.Id", Model.Contactos.Where(x => x.TipoContacto == 1).FirstOrDefault().Id) %>
                </p>
            </div>
            <div class="clear">
            </div>
        </div>
    </fieldset>
    <%} %>
    <fieldset>
        <legend>Observaciones</legend>
        <%=Html.TextArea("Observacion",Model.Observacion, new { style = "width: 100%", title="Información adicional de cliente"})%>
        <br />
    </fieldset>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("Lista"), "Cancelar", Iconos.arrow_1_w, IconPosition.left, new {title="Volver a lista de Clientes" })%>
    </p>
    <p style="float: right">
        <%=Html.ButtonSubmit("Guardar") %>
    </p>
    <% } %>
    <%= Html.ClientSideValidation("Dire", typeof(Data.Modelo.Direccion)) %>
    <%= Html.ClientSideValidation("Fono", typeof(Data.Modelo.Contacto)) %>
    <%= Html.ClientSideValidation("Email", typeof(Data.Modelo.Contacto)) %>
    <%= Html.ClientSideValidation("", typeof(Data.Modelo.Cliente)) %>
    <%=Html.ClientSideValidation("ClienteParticular", typeof(Data.Modelo.ClienteParticular))%>
    <%=Html.ClientSideValidation("ClienteComercial", typeof(Data.Modelo.ClienteComercial))%>
</asp:Content>
