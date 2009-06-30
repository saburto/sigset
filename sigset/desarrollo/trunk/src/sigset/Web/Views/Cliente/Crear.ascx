<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <%= Html.ValidationSummary("No se puede Crear Cliente. Corriga los siguientes errores.") %>

    <% using (Ajax.BeginForm("Crear", "Cliente", new AjaxOptions {LoadingElementId="loadingAjax", UpdateTargetId="datosCliente" }))
       {%>

        <fieldset>
            <legend>Nuevo Cliente</legend>
            <div class="three-column-container">
            <div class="three-column-left">
            <p>
                <label for="Rut">Rut:</label>
                <%= Html.TextBox("Rut", null, new Dictionary<string, object>() { { "maxlength", "10" }, { "size", "10" } })%> -
                <%= Html.TextBox("dv", null, new Dictionary<string, object>() { { "maxlength", "1" }, { "size", "1" } })%>
                <%= Html.ValidationMessage("Rut", "*")%>
            </p>
            <p>
                <label for="Apellido_Paterno">Apellido Paterno:</label>
                <%= Html.TextBox("Apellido_Paterno")%>
                <%= Html.ValidationMessage("Apellido_Paterno", "*")%>
            </p>
            </div>
            <div class="three-column-middle">
            <p>
                <label for="Nombre">Nombre:</label>
                <%= Html.TextBox("Nombre")%>
                <%= Html.ValidationMessage("Nombre", "*")%>
            </p>
            <p>
                <label for="Apellido_Materno">Apellido Materno:</label>
                <%= Html.TextBox("Apellido_Materno")%>
                <%= Html.ValidationMessage("Apellido_Materno", "*")%>
            </p>
            </div>
            <div class="clear"></div>
            </div>
            <br />
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>
    <% } %>
