<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Direccion>" %>

    <%= Html.ValidationSummary("Creación de Dirección con errores.") %>
    <% using (Ajax.BeginForm("CrearDireccion", "Cliente", new { rut = ViewData["rutCliente"] }, new AjaxOptions { UpdateTargetId = "datosDireccion", LoadingElementId="loadingAjax", HttpMethod="POST" }))
       {%>

        <fieldset>
            <legend><%=Html.Encode("Nueva Dirección")%></legend>
            <p>
                <label for="Region">Region:</label>
                <%= Html.TextBox("Region")%>
                <%= Html.ValidationMessage("Region", "*")%>
            </p>
            <p>
                <label for="Ciudad">Ciudad:</label>
                <%= Html.TextBox("Ciudad")%>
                <%= Html.ValidationMessage("Ciudad", "*")%>
            </p>
            <p>
                <label for="Comuna">Comuna:</label>
                <%= Html.TextBox("Comuna")%>
                <%= Html.ValidationMessage("Comuna", "*")%>
            </p>
            <p>
                <label for="Calle">Calle:</label>
                <%= Html.TextBox("Calle")%>
                <%= Html.ValidationMessage("Calle", "*")%>
            </p>
            <p>
                <label for="Numero">Numero:</label>
                <%= Html.TextBox("Numero")%>
                <%= Html.ValidationMessage("Numero", "*")%>
            </p>
            <p>
                <label for="Codigo_Postal">Codigo Postal:</label>
                <%= Html.TextBox("Codigo_Postal")%>
                <%= Html.ValidationMessage("Codigo_Postal", "*")%>
            </p>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>
    <p>
        <%=Ajax.ActionLink("Cancelar", "Detalles", "Cliente", new { rut = ViewData["rutCliente"] }, new AjaxOptions { LoadingElementId = "loadingAjax", UpdateTargetId = "datosCliente" }) %>
    </p>