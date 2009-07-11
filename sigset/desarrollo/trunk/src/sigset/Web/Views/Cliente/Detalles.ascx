<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>
<div class="three-column-container">
<div class="three-column-left">
        <h2>Cliente</h2>
        <p>
            <%= Html.Encode(Model.Nombre) %> <%= Html.Encode(Model.Apellido_Paterno) %> <%= Html.Encode(Model.Apellido_Materno) %>
        </P>
        <p>
            Rut:
            <%= Html.Encode(Model.Rut.GetRutCompleto())%>
        </p>
        <p>
            <%=Html.ActionLink("Editar", "Editar", new { id = Model.Rut })%>
        </p>
</div>
<div class="three-column-middle">
        <h2><%=Html.Encode("Dirección") %></h2>
        <div id="datosDireccion">
        <% Html.RenderPartial("Direcciones", Model.Direccions); %>
        </div>
</div>

<div class="three-column-right">
        <h2>Contacto</h2>
        <% Html.RenderPartial("Contactos", Model.Contactos); %>
</div>
</div>

    

