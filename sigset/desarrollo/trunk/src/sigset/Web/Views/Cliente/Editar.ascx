<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>

    <%= Html.ValidationSummary("Edición de cliente con los siguientes errores.") %>

    <% using (Html.BeginForm("Crear", "Cliente"))
    {%>
        <fieldset>
            <legend>Editar Cliente</legend>
            
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
                    <%= Html.TextBox("Calle", Model.Direccions.FirstOrDefault().Calle)%>
                    <%= Html.ValidationMessage("Calle", "*")%>
            </div>
            
            <div class="three-column-middle">

                <label for="Numero"><%=Html.Encode("Número:") %></label>
                <%= Html.TextBox("Numero",Model.Direccions.FirstOrDefault().Calle)%>
                <%= Html.ValidationMessage("Numero", "*")%>

            </div>
            </div>
            <br /><br />
            <div class="three-column-container">
            <div class="three-column-left">

                    <label for="Region"><%=Html.Encode("Region:")%></label>
                    <%= Html.AutoCompleteTextBox("Region",Model.Direccions.FirstOrDefault().Region1.Nombre, Model.Direccions.FirstOrDefault().Region,null)%>
                    <%= Html.ValidationMessage("Region", "*")%>
            </div>
            
            <div class="three-column-middle">
   
                    <label for="Provincia">Provincia:</label>
                    <%= Html.AutoCompleteTextBox("Provincia", Model.Direccions.FirstOrDefault().Provincia1.nombre, Model.Direccions.FirstOrDefault().Provincia,null)%>
                    <%= Html.ValidationMessage("Provincia", "*")%>
            </div>
            
            <div class="three-column-right">
            
                <label for="Comuna">Comuna:</label>
                <%= Html.AutoCompleteTextBox("Comuna", Model.Direccions.FirstOrDefault().Comuna1.Nombre, Model.Direccions.FirstOrDefault().Comuna,null)%>
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
                <%= Html.ValidationMessage("Email.Valor_Contacto", "*") %>

            </div>
            <div class="three-column-middle">

                <label for="Valor_Contacto"><%=Html.Encode("Teléfono:") %></label>
                <%= Html.TextBox("Fono.Valor_Contacto", Model.Contactos.Where(x => x.Tipo_Contacto == 1).FirstOrDefault().Valor_Contacto)%>
                <%= Html.ValidationMessage("Fono.Valor_Contacto", "*") %>
            </p>
            </div>
            </div>
        </fieldset>
        <%} %>
        
        <fieldset>
                <input type="submit" class="button-big" value="Grabar" />
        </fieldset>
    <% } %>

    <p>
       <%=Ajax.ActionLink("Cancelar", "Detalles", "Cliente", new { rut = Model.Rut }, new AjaxOptions { UpdateTargetId = "datosCliente", LoadingElementId = "loadingAjax", })%>
    </p>


