<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <%= Html.ValidationSummary() %>

    <% using (Html.BeginForm("Guardar", "TipoArticulo", FormMethod.Post))
       {%>

        <fieldset>
         
            <p>
                <label for="Descripcion">Descripci&oacute;n:</label>
                <%= Html.Hidden("IdTipoArticulo", null)%>
                <%= Html.TextBox("Descripcion", null, new { title="Descripción de un nuevo tipo artículo", @class="required" })%>
                <%= Html.ValidationMessage("Descripcion", "*") %>
            </p>
        </fieldset>
       <p>
           <%=Html.ButtonSubmit("Guardar") %>
          
       </p>
    <% } %>
    
    
    


