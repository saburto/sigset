<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <%= Html.ValidationSummary("No se puede Crear Cliente. Corriga los siguientes errores.") %>

    <% using (Ajax.BeginForm("Crear", "Cliente", new AjaxOptions {LoadingElementId="loadingAjax", UpdateTargetId="datosCliente" }))
       {%>

        <fieldset>
            <legend>Cliente</legend>
            
            <div class="three-column-container">
                <div class="three-column-left">
                    <label for="Rut">Rut:</label>
                    <%= Html.RutTextBox() %>
                    <%= Html.ValidationMessage("Rut", "*")%>
                    <input type="button" value="Buscar" title="Buscar Cliente"/>
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
            
            
                <label for="Apellido_Paterno">Apellido Paterno:</label>
                <%= Html.TextBox("Apellido_Paterno")%>
                <%= Html.ValidationMessage("Apellido_Paterno", "*")%>
            </div>
            
            <div class="three-column-right">
                <label for="Apellido_Materno">Apellido Materno:</label>
                <%= Html.TextBox("Apellido_Materno")%>
                <%= Html.ValidationMessage("Apellido_Materno", "*")%>
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
                    <%= Html.TextBox("Region")%>
                    <%= Html.ValidationMessage("Region", "*")%>

            </div>
            
            <div class="three-column-middle">
   
                    <label for="Ciudad">Ciudad:</label>
                    <%= Html.TextBox("Ciudad")%>
                    <%= Html.ValidationMessage("Ciudad", "*")%>
   
            </div>
            
            <div class="three-column-right">
            
                <label for="Comuna">Comuna:</label>
                <%= Html.TextBox("Comuna")%>
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
