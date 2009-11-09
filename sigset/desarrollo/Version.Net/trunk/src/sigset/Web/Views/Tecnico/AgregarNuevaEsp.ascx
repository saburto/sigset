<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Data.Modelo.Tecnico>>" %>
    <h2>Agregar Nueva Especialidad</h2>

    <%= Html.ValidationSummary("No se ha agregado nueva especialidad. Favor corrija los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>
     <% var espe =  ViewData["tipoEspecialidades"] as IList<Data.Modelo.TipoEspecialidad>; %>
        <fieldset>
            <legend>Especialidades</legend>
            <div>
                <%=Html.Hidden("IdTecnico", Model.Id) %>
            </div>
            <%foreach (var item in espe)
              {%>
              <p>
                <input type="checkbox" name="especialidades" <%=(Model.Especialidades.Where(x => x.TipoEspecialidad == item.IdTipoEspecialidad).Any()? "checked=\"checked\"" : "")  %>  value="<%=item.IdTipoEspecialidad %>" />
                <label for="<%=item.IdTipoEspecialidad %>"  style="display:inline !important" ><%=Html.Encode(item.Descripcion) %></label>
              </p>
                  
              <%} %>
        </fieldset>
            <p>
                <%=Html.ButtonSubmit("Guardar") %>
            </p>

    <% } %>

    