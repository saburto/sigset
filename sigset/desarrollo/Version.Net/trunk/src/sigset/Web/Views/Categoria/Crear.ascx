<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <%= Html.ValidationSummary() %>

    <% using (Html.BeginForm("Guardar", "Categoria", FormMethod.Post))
       {%>

        <fieldset>
         
            <p>
                <label for="Descripcion">Descripci&oacute;n:</label>
                <%= Html.Hidden("IdCategoria", null)%>
                <%= Html.TextBox("Descripcion", null, new { title="Descripción de nueva categoría", @class="required" })%>
                <%= Html.ValidationMessage("Descripcion", "*") %>
                
                <label>Especialidad:</label>
                <%=Html.DropDownList("TipoEspcialidad",null, new { name = "IdTipoEspcialidad" })%>
                
            </p>
        </fieldset>
       <p>
           <%=Html.ButtonSubmit("Guardar") %>
          
       </p>
    <% } %>
    <%=Html.ClientSideValidation("", typeof(Data.Modelo.Categoria)) %>
    
    


