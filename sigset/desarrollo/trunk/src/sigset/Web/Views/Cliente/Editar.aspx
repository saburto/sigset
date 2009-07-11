<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Cliente>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Cliente
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%using (Html.BeginReady()) {%>
    
    <%= Html.InitializeAutoComplete("Dire.Region", "EncontrarRegiones", "Cliente", true,15) %>
    <%= Html.InitializeAutoComplete("Dire.Provincia", "EncontrarProvincias", "Cliente", true, "Dire.Region", 30, 0) %>
    <%= Html.InitializeAutoComplete("Dire.Comuna", "EncontrarComunas", "Cliente", true, "Dire.Provincia",100,0 ) %>
    
    <%} %>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Editar Cliente</h2>

    <%= Html.ValidationSummary("Edición de cliente con los siguientes errores.") %>

    <% using (Html.BeginForm())
    {%>
        <fieldset>
            <legend>Cliente</legend>
            
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Rut">Rut:</label>
                <%= Html.RutTextBox(Model.Rut,true)%>
                <%= Html.ValidationMessage("Rut", "*") %>
                </div>
                <div class="clear"></div>
            </di>
            
            <div class="three-column-container">
                <div class="three-column-left">
                    <label for="Nombre">Nombre:</label>
                    <%= Html.TextBox("Nombre", Model.Nombre) %>
                    <%= Html.ValidationMessage("Nombre", "*") %>
                </div>
                <div class="three-column-middle">
                    <label for="Apellido Paterno">Apellido Paterno:</label>
                    <%= Html.TextBox("Apellido_Paterno", Model.Apellido_Paterno) %>
                    <%= Html.ValidationMessage("Apellido_Paterno", "*") %>
                </div>
                <div class="three-column-right">
                    <label for="Apellido Materno">Apellido Materno:</label>
                    <%= Html.TextBox("Apellido_Materno", Model.Apellido_Materno) %>
                    <%= Html.ValidationMessage("Apellido_Materno", "*") %>
                </div>
            </div>
            <div class="clear"></div>
            </div>
        </fieldset>
        
        <%if(Model.Direccions != null && Model.Direccions.FirstOrDefault() != null){ %>
          <fieldset>
            <legend><%=Html.Encode("Dirección")%></legend>
            <div class="three-column-container">
            
            <div class="three-column-left">

                    <label for="Calle">Calle:</label>
                    <%= Html.TextBox("Dire.Calle", Model.Direccions.FirstOrDefault().Calle)%>
                    <%= Html.ValidationMessage("Calle", "*")%>
                    <%= Html.Hidden("Dire.Tipo_Direccion", Model.Direccions.FirstOrDefault().Tipo_Direccion)%>
                    <%= Html.Hidden("Dire.Id", Model.Direccions.FirstOrDefault().Id)%>
            </div>
            
            <div class="three-column-middle">

                <label for="Numero"><%=Html.Encode("Número:") %></label>
                <%= Html.TextBox("Dire.Numero", Model.Direccions.FirstOrDefault().Numero)%>
                <%= Html.ValidationMessage("Numero", "*")%>

            </div>
            </div>
            <br /><br />
            <div class="three-column-container">
            <div class="three-column-left">

                    <label for="Region"><%=Html.Encode("Región:")%></label>
                    <%if (Model.Direccions.FirstOrDefault().Region1 != null)
                    { %>
                    <%= Html.AutoCompleteTextBox("Dire.Region", Model.Direccions.FirstOrDefault().Region1.Nombre, Model.Direccions.FirstOrDefault().Region, null)%>
                    <%}
                    else { %>
                    <%= Html.AutoCompleteTextBox("Dire.Region")%>
                    <%} %>
                    <%= Html.ValidationMessage("Region", "*")%>
            </div>
            
            <div class="three-column-middle">
   
                    <label for="Provincia">Provincia:</label>
                    <%if (Model.Direccions.FirstOrDefault().Provincia1 != null)
                    { %>
                    <%= Html.AutoCompleteTextBox("Dire.Provincia", Model.Direccions.FirstOrDefault().Provincia1.nombre, Model.Direccions.FirstOrDefault().Provincia, null)%>
                    <%}
                    else { %>
                    <%= Html.AutoCompleteTextBox("Dire.Provincia")%>
                    <%} %>

                    <%= Html.ValidationMessage("Provincia", "*")%>
            </div>
            
            <div class="three-column-right">
            
                <label for="Comuna">Comuna:</label>
                <%if (Model.Direccions.FirstOrDefault().Comuna1 != null)
                { %>
                <%= Html.AutoCompleteTextBox("Dire.Comuna", Model.Direccions.FirstOrDefault().Comuna1.Nombre, Model.Direccions.FirstOrDefault().Comuna, null)%>
                <%}
                else { %>
                <%= Html.AutoCompleteTextBox("Dire.Comuna")%>
                <%} %>
                <%= Html.ValidationMessage("Comuna", "*")%>
            
            </div>
            <div class="clear"></div>
            </div>
        </fieldset>
        <%} %>
        
        <%if(Model.Contactos != null && Model.Contactos.Any()){ %>
        <fieldset>
            <legend>Contacto</legend>
            <div class="three-column-container">
            <div class="three-column-left">


                <label for="Valor_Contacto"><%=Html.Encode("Correo Electrónico:") %></label>
                <%= Html.TextBox("Email.Valor_Contacto", Model.Contactos.Where(x=> x.Tipo_Contacto == 3).FirstOrDefault().Valor_Contacto)%>
                <%= Html.ValidationMessage("Email.Valor_Contacto", "*")%>
                <%= Html.Hidden("Email.Tipo_Contacto", Model.Contactos.Where(x => x.Tipo_Contacto == 3).FirstOrDefault().Tipo_Contacto) %>
                <%= Html.Hidden("Email.Id", Model.Contactos.Where(x => x.Tipo_Contacto == 3).FirstOrDefault().Id) %>

            </div>
            <div class="three-column-middle">

                <label for="Valor_Contacto"><%=Html.Encode("Teléfono:") %></label>
                <%= Html.TextBox("Fono.Valor_Contacto", Model.Contactos.Where(x => x.Tipo_Contacto == 1).FirstOrDefault().Valor_Contacto)%>
                <%= Html.ValidationMessage("Fono.Valor_Contacto", "*")%>
                <%= Html.Hidden("Fono.Tipo_Contacto", Model.Contactos.Where(x => x.Tipo_Contacto == 1).FirstOrDefault().Tipo_Contacto) %>
                <%= Html.Hidden("Fono.Id", Model.Contactos.Where(x => x.Tipo_Contacto == 1).FirstOrDefault().Id) %>
            </p>
            </div>
            </div>
        </fieldset>
        <%} %>
        
        <fieldset>
                <input type="submit" class="button-big" value="Grabar" />
        </fieldset>
    <% } %>
    <%= Html.ClientSideValidation("Dire", typeof(Data.Modelo.Direccion)) %>
    <%= Html.ClientSideValidation("Fono", typeof(Data.Modelo.Contacto)) %>
    <%= Html.ClientSideValidation("Email", typeof(Data.Modelo.Contacto)) %>
    <%= Html.ClientSideValidation("", typeof(Data.Modelo.Cliente)) %>
    
    <p>
       <%=Html.ActionLink("Cancelar", "Lista")%>
    </p>
</asp:Content>

