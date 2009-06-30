<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>

    <%= Html.ValidationSummary("Edición de cliente con los siguientes errores.") %>

    <% using (Ajax.BeginForm("Crear", "Cliente", new AjaxOptions {LoadingElementId="loadingAjax", UpdateTargetId="datosCliente" }))
    {%>
        <fieldset>
            <legend>Cliente</legend>
            <div class="three-column-container">
            <div class="three-column-left">
            <p>
                <label for="Rut">Rut:</label>
                <%= Html.TextBox("Rut", Model.Rut, new Dictionary<string, object>(){{"readonly","readonly"}})%>
                <%= Html.ValidationMessage("Rut", "*") %>
            </p>
            <p>            
                <label for="Apellido Paterno">Apellido_Paterno:</label>
                <%= Html.TextBox("Apellido_Paterno", Model.Apellido_Paterno) %>
                <%= Html.ValidationMessage("Apellido_Paterno", "*") %>
            </p>
            </div>
            <div class="three-column-middle">
            <p>
                <label for="Nombre">Nombre:</label>
                <%= Html.TextBox("Nombre", Model.Nombre) %>
                <%= Html.ValidationMessage("Nombre", "*") %>
            </p>
            <p>
                <label for="Apellido Materno">Apellido_Materno:</label>
                <%= Html.TextBox("Apellido_Materno", Model.Apellido_Materno) %>
                <%= Html.ValidationMessage("Apellido_Materno", "*") %>
            </p>
            </div>
            <div class="clear"></div>
            </div>
            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    <p>
       <%=Ajax.ActionLink("Cancelar", "Detalles", "Cliente", new { rut = Model.Rut }, new AjaxOptions { UpdateTargetId = "datosCliente", LoadingElementId = "loadingAjax", })%>
    </p>


