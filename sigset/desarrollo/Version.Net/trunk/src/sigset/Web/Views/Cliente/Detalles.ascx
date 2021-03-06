<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>
<h2>
    Cliente</h2>
<%if (Model.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteParticular)
  { %>
<p>
    <%= Html.Encode(Model.ClienteParticular.Nombre) %>
    <%= Html.Encode(Model.ClienteParticular.ApellidoPaterno) %>
    <%= Html.Encode(Model.ClienteParticular.ApellidoMaterno) %>
</p>
<p>
    Rut:
    <%= Html.Encode(Model.ClienteParticular.Rut.GetRutCompleto())%>
</p>
<%}
  else if (Model.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteComercial)
  { %>
<p>
    <%= Html.Encode(Model.ClienteComercial.RazonSocial) %>
    <% if (!string.IsNullOrEmpty(Model.ClienteComercial.Sucursal))
       { %>
     Sucursal:
    <%= Html.Encode(Model.ClienteComercial.Sucursal) %>
    <%} %>
</p>
<p>
    Rut:
    <%= Html.Encode(Model.ClienteComercial.Rut.GetRutCompleto())%>
</p>
<%} %>
<div class="clear">
</div>
<div class="two-column-container">
    <div class="two-column-left">
        <h2>
            <%=Html.Encode("Dirección") %></h2>
        <div id="datosDireccion">
            <% Html.RenderPartial("Direccion", Model.Direccion); %>
        </div>
    </div>
    <div class="two-column-right">
        <h2>
            Contacto</h2>
        <% Html.RenderPartial("Contactos", Model.Contactos); %>
    </div>
</div>
<div class="clear">
</div>

<%if(Model.Observacion.isNotNull()){ %>
<h2>Observaciones</h2>
<p><%=Html.Encode(Model.Observacion) %></p>
<%} %>

<br />
<p>
    <%= Html.ButtonLinkIcon(Url.Action("Editar", new { id = Model.Id }), "Editar", Iconos.pencil, IconPosition.left, new { title="Editar información de cliente"})%>
    <%= Html.ButtonLinkIcon(Url.Action("Crear","OrdenTrabajo", new {id = Model.Id }),"Agregar Orden Trabajo",Iconos.note,IconPosition.left,new{title="Agregar Nueva Orden de trabajo"})  %>
</p>
