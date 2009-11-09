<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Tecnico>" %>
    <%= Html.ValidationSummary("No se ha agregado nueva especialidad. Favor corrija los siguientes errores.") %>

    <% using (Html.BeginForm("AgregarNuevaEspecialidad", "Tecnico", FormMethod.Post, new {id="formEsp" }))
       {%>
     <% var espe = ViewData["tipoEspecialidades"] as IList<Data.Modelo.TipoEspecialidad>; %>
        <fieldset>
            <div>
                <%=Html.Hidden("IdTecnico", Model.Id)%>
            </div>
            <%foreach (var item in espe)
              {%>
              <p>
                <input type="checkbox" name="especialidades" <%=(Model.Especialidades.Where(x => x.TipoEspecialidad == item.IdTipoEspecialidad).Any()? "checked=\"checked\"" : "")  %>  value="<%=item.IdTipoEspecialidad %>" />
                <label for="<%=item.IdTipoEspecialidad %>"  style="display:inline !important" ><%=Html.Encode(item.Descripcion)%></label>
              </p>
                  
              <%} %>
        </fieldset>
            <p>
            <% if (ViewData["ventana"] == null)
               {%>
                <%=Html.ButtonSubmit("Guardar")%>
            <%}
               else
               { %>
                    <%=Html.ButtonLinkIcon("#", "Guardar",Iconos.disk, null, new{ onclick="return guardarCerrar()" })%>
                <% %>
                
            <%} %>
            </p>
    <% } %>
    
    <script type="text/javascript">
    //<![CDATA[

        function guardarCerrar() {
            $.post($('#formEsp').attr('action'), $("#formEsp input:checked, #IdTecnico"), function() {
                window.location.reload();
            });
        }
    
    //]]>
    </script>

    