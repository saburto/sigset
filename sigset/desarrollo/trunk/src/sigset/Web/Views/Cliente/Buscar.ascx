<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
    <% using (Ajax.BeginForm("Buscar","Cliente",new AjaxOptions {UpdateTargetId="datosCliente", LoadingElementId="loadingAjax" }))
       { %>
    <div>
            <fieldset>
            <legend>Ingresar Datos Cliente</legend>
                <p>
                    <label for="rut">Rut:</label>
                    <%= Html.TextBox("rutCliente")%>
                    <%= Html.ValidationMessage("rutCliente", "*")%>
                 </p>
                <p>
                    <input type="submit" value="Buscar Cliente" />
                </p>
            </fieldset>
        </div>
    <%} %>
