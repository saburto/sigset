<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Detalle>" %>
        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Id">Id:</label>
                <%= Html.TextBox("Id") %>
                <%= Html.ValidationMessage("Id", "*") %>
            </p>
            <p>
                <label for="Contenido">Contenido:</label>
                <%= Html.TextBox("Contenido") %>
                <%= Html.ValidationMessage("Contenido", "*") %>
            </p>
            <p>
                <label for="Estado">Estado:</label>
                <%= Html.TextBox("Estado") %>
                <%= Html.ValidationMessage("Estado", "*") %>
            </p>
            
        </fieldset>
        <p>
            <input type="submit" value="Create" />
        </p>

    <% } %>



