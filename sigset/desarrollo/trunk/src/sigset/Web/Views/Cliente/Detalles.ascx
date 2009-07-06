<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>
<div class="three-column-container">
<div class="three-column-left">
        <h2>Cliente</h2>
        <p>
            Rut:
            <%= Html.Encode(Model.Rut.GetRutCompleto())%>
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
        <h2><%=Html.Encode("Dirección") %></h2>
        <div id="datosDireccion">
        <% Html.RenderPartial("Direcciones", Model.Direccions); %>
        </div>
</div>

<div class="three-column-right">
        <h2>Contacto</h2>
</div>

</div>
<div class="linea"></div>
    

