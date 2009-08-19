<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Articulo>" %>

    <%= Html.ValidationSummary("Busca arroja error.") %>

    <% using (Ajax.BeginForm("Buscar", "Articulo", new AjaxOptions { UpdateTargetId = "resultado", LoadingElementId = "loadingAjax" }))
       {%>

        <fieldset>
            <legend>Buscar Articulo</legend>
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Modelo">Modelo:</label>
                <%= Html.TextBox("Modelo") %>
                <%= Html.ValidationMessage("Modelo", "*") %>
                </div>
                <div class="three-column-middle">
                <label for="Modelo">Marca:</label>
                <%= Html.TextBox("Marca") %>
                <%= Html.Hidden("Rut", TempData["rutOrden"])%>
                <%= Html.ValidationMessage("Marca", "*") %>
                </div>
            </div>
            <div class="clear"></div>    
            <br />
            <input type="submit" value="Buscar" />
        </fieldset>
    <% } %>
    
    <div id="resultado"></div>



