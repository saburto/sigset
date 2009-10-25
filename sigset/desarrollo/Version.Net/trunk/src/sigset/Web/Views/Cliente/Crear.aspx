<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Cliente
</asp:Content>
<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%using (Html.BeginReady()) {%>
    
    <%= Html.InitializeAutoComplete("Region", "EncontrarRegiones", "Cliente", true,15) %>
    <%= Html.InitializeAutoComplete("Provincia", "EncontrarProvincias", "Cliente", true, "Region", 30, 0) %>
    <%= Html.InitializeAutoComplete("Comuna", "EncontrarComunas", "Cliente", true, "Provincia",100,0 ) %>
    
    <%} %>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%= Html.ValidationSummary("Se producieron los siguientes errores.") %>

    <% using(Html.BeginForm("Crear", "Cliente"))
       {%>
        <fieldset>
            <legend>Cliente</legend>
            <div class="three-column-container">
                <div class="three-column-left">
                    <label for="Rut">Rut:</label>
                    <%= Html.RutTextBox() %>
                    <%= Html.ValidationMessage("Rut", "*")%>
                </div>
                <div class="clear"></div>
            </div>
            
            <div class="three-column-container">
            <div class="three-column-left">

                <label for="Nombre">Nombre:</label>
                <%= Html.TextBox("Nombre")%>
                <%= Html.ValidationMessage("Nombre", "*")%>
            </div>
            
            <div class="three-column-middle">
            
            
                <label for="ApellidoPaterno">Apellido Paterno:</label>
                <%= Html.TextBox("ApellidoPaterno")%>
                <%= Html.ValidationMessage("ApellidoPaterno", "*")%>
            </div>
            
            <div class="three-column-right">
                <label for="ApellidoMaterno">Apellido Materno:</label>
                <%= Html.TextBox("ApellidoMaterno")%>
                <%= Html.ValidationMessage("ApellidoMaterno", "*")%>
            </div>
            
            
            <div class="clear"></div>
            </div>

        </fieldset>
        <fieldset>
            <legend><%=Html.Encode("Dirección")%></legend>
            <div class="three-column-container">
            
            <div class="three-column-left">

                    <label for="Calle">Calle:</label>
                    <%= Html.TextBox("Calle")%>
                    <%= Html.ValidationMessage("Calle", "*")%>
            </div>
            
            <div class="three-column-middle">

                <label for="Numero"><%=Html.Encode("Número:") %></label>
                <%= Html.TextBox("Numero")%>
                <%= Html.ValidationMessage("Numero", "*")%>

            </div>
            </div>
            <br /><br />
            <div class="three-column-container">
            <div class="three-column-left">

                    <label for="Region"><%=Html.Encode("Region:")%></label>
                    <%= Html.AutoCompleteTextBox("Region")%>
                    <%= Html.ValidationMessage("Region", "*")%>
            </div>
            
            <div class="three-column-middle">
   
                    <label for="Provincia">Provincia:</label>
                    <%= Html.AutoCompleteTextBox("Provincia")%>
                    <%= Html.ValidationMessage("Provincia", "*")%>
            </div>
            
            <div class="three-column-right">
            
                <label for="Comuna">Comuna:</label>
                <%= Html.AutoCompleteTextBox("Comuna")%>
                <%= Html.ValidationMessage("Comuna", "*")%>
            
            </div>
            <div class="clear"></div>
            </div>
        </fieldset>
        
        <fieldset>
            <legend>Contacto</legend>
            <div class="three-column-container">
            <div class="three-column-left">


                <label for="Valor_Contacto"><%=Html.Encode("Correo Electrónico:") %></label>
                <%= Html.TextBox("Email.Valor_Contacto")%>
                <%= Html.ValidationMessage("Email.Valor_Contacto", "*") %>

            </div>
            <div class="three-column-middle">

                <label for="Valor_Contacto"><%=Html.Encode("Teléfono:") %></label>
                <%= Html.TextBox("Fono.Valor_Contacto") %>
                <%= Html.ValidationMessage("Fono.Valor_Contacto", "*") %>
            </p>
            </div>
            </div>
        </fieldset>
        
        
        <fieldset>
                <input type="submit" class="button-big" value="Grabar" />
        </fieldset>
    <% } %>
</asp:Content>