<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <%= Html.ValidationSummary() %>

    <% using (Html.BeginForm("Guardar", "Especialidad", FormMethod.Post))
       {%>

        <fieldset>
         
            <p>
                <label for="Descripcion">Descripci&oacute;n:</label>
                <%= Html.Hidden("IdTipoEspecialidad", null) %>
                <%= Html.TextBox("Descripcion", null, new { title="Descripción de nueva especialidad", @class="required" })%>
                <%= Html.ValidationMessage("Descripcion", "*") %>
            </p>
        </fieldset>
       <p>
           <%=Html.ButtonSubmit("Guardar") %>
          
       </p>
    <% } %>
    <%=Html.ClientSideValidation("", typeof(Data.Modelo.TipoEspecialidad)) %>
    
    


