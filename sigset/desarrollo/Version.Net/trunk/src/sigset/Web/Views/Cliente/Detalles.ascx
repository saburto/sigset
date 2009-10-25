<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>

        <h2>Cliente</h2>
        <p>
            <%= Html.Encode(Model.Nombre) %> <%= Html.Encode(Model.ApellidoPaterno) %> <%= Html.Encode(Model.ApellidoMaterno) %>
        </P>
        <p>
            Rut:
            <%= Html.Encode(Model.Rut.GetRutCompleto())%>
        </p>
        
<div class="clear"></div>        
<div class="three-column-container">
<div class="three-column-left">
        <h2><%=Html.Encode("Dirección") %></h2>
        <div id="datosDireccion">
        <% Html.RenderPartial("Direcciones", Model.Direccions); %>
        </div>
</div>

<div class="three-column-middle">
        <h2>Contacto</h2>
        <% Html.RenderPartial("Contactos", Model.Contactos); %>
</div>
</div>
<div class="clear"></div>        
<p>
[<%=Html.ActionLink("Editar", "Editar", new { id = Model.Rut })%>]|
[<%=Html.ActionLink("Agregar Orden Trabajo", "Crear", "OrdenTrabajo", new {rut = Model.Rut },null)%>]
</p>
    

