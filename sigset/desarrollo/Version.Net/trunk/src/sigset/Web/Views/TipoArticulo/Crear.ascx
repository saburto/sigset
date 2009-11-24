<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <%= Html.ValidationSummary() %>

    <% using (Html.BeginForm("Guardar", "TipoArticulo", FormMethod.Post))
       {%>

        <fieldset>
         
            <p>
                <label for="Descripcion">Descripci&oacute;n:</label>
                <%= Html.Hidden("IdTipoArticulo", null)%>
                <%= Html.TextBox("Descripcion", null, new { title="Descripci�n de un nuevo tipo art�culo", @class="required" })%>
                <%= Html.ValidationMessage("Descripcion", "*") %>
            </p>
        </fieldset>
       <p>
           <%=Html.ButtonSubmit("Guardar") %>
          
       </p>
    <% } %>
    
    
    


