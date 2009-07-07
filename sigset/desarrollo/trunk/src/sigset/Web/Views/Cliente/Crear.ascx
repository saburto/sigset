<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%--using (Html.BeginForm("Crear", "Cliente", new AjaxOptions {LoadingElementId="loadingAjax", UpdateTargetId="datosCliente" }))--%>
    <%= Html.ValidationSummary("Se producieron los siguientes errores.") %>

    <% using(Html.BeginForm("Crear", "Cliente"))
       {%>
        <fieldset>
            <legend>Cliente</legend>
            
            <script>
                function buscarCliente() {
                    var form = document.forms[0];
                    form.action = '<%= Url.Action("Buscar","Cliente") %>';
                    form.submit();
                    return true;
                }
            </script>
            
            <div class="three-column-container">
                <div class="three-column-left">
                    <label for="Rut">Rut:</label>
                    <%= Html.RutTextBox() %>
                    <%= Html.ValidationMessage("Rut", "*")%>
                    <input type="submit" value="Buscar" title="Buscar Cliente" onclick="buscarCliente()" />
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
            <legend><%=Html.Encode("Direcci�n")%></legend>
            <div class="three-column-container">
            
            <div class="three-column-left">

                    <label for="Calle">Calle:</label>
                    <%= Html.TextBox("Calle")%>
                    <%= Html.ValidationMessage("Calle", "*")%>
            </div>
            
            <div class="three-column-middle">

                <label for="Numero"><%=Html.Encode("N�mero:") %></label>
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


                <label for="Valor_Contacto"><%=Html.Encode("Correo Electr�nico:") %></label>
                <%= Html.TextBox("Email.Valor_Contacto")%>
                <%= Html.ValidationMessage("Email.Valor_Contacto", "*") %>

            </div>
            <div class="three-column-middle">

                <label for="Valor_Contacto"><%=Html.Encode("Tel�fono:") %></label>
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
