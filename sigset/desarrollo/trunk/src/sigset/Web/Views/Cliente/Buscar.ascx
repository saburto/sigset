<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
    <% using (Ajax.BeginForm("Buscar", "Cliente", new AjaxOptions { UpdateTargetId = "resultadoBusqueda", LoadingElementId = "loadingAjax" }))
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
            <div class="three-column-middle">                 
                 <p>
                    <label for="Apellido_Paterno">Buscar por Apellido Paterno:</label>
                    <%= Html.TextBox("Apellido_Paterno")%>
                    <%= Html.ValidationMessage("Apellido_Paterno", "*")%>
                 </p>
             </div>
             <div class="clear"></div>
             </div>
                <p>
                    <input type="submit" value="Buscar Cliente" />
                </p>
            </fieldset>
        </div>
    <%} %>
    <div id="resultadoBusqueda"></div>