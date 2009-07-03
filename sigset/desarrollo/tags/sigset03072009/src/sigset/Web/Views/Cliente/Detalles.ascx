<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>
<div class="three-column-container">
<div class="three-column-left">
        <h2>Cliente</h2>
        <p>
            Rut:
            <%= Html.Encode(Model.Rut) %>-<%= Html.ViewData["dv"] %>
        </p>
        <p>
            Nombre:
            <%= Html.Encode(Model.Nombre) %> <%= Html.Encode(Model.Apellido_Paterno) %> <%= Html.Encode(Model.Apellido_Materno) %>
        </p>
        <p>
            <%=Ajax.ActionLink("Editar", "Editar", "Cliente", new { rut = Model.Rut }, new AjaxOptions { LoadingElementId="loadingAjax", UpdateTargetId="datosCliente" })%>
        </p>
</div>
<div class="three-column-middle">
        <h2><%=Html.Encode("Direcci�n") %></h2>
        <div id="datosDireccion">
        <% Html.RenderPartial("Direcciones", Model.Direccion); %>
            <p>
                <%= Ajax.ActionLink("Agregar", "CrearDireccion", "Cliente", new { rut = Model.Rut }, new AjaxOptions { LoadingElementId = "loadingAjax", UpdateTargetId = "datosDireccion", HttpMethod="GET" })%>
            </p>
        </div>
</div>

<div class="three-column-right">
        <h2>Contacto</h2>
</div>

</div>
<div class="linea"></div>
    

