<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.OrdenTrabajo>" %>
<div>
    <%if (Model != null && Model.Cliente != null)
      { %>
    <% Html.RenderPartial("DatosCliente", Model.Cliente); %>
    <%} %>
    <%if (Model != null && Model.Articulo != null)
      { %>
    <% Html.RenderPartial("DatosArticulo", Model.Articulo); %>
    <%} %>
    <fieldset>
        <legend>Orden de Trabajo</legend>
        <div class="detalle">
            <div class="three-column-container">
                <div class="three-column-left">
                    <p>
                        <span style="font-weight: bold">
                            <%=Html.Encode("Número de Orden:") %></span>
                        <%= Html.Encode(String.Format("{0}", Model.Id)) %>
                    </p>
                    <p>
                        <span style="font-weight: bold">N° Serie <%=Html.Encode("Artículo")%>:</span>
                        <%= Html.Encode(Model.Serie) %>
                    </p>
                </div>
                <div class="three-column-middle">
                    <p>
                        <span style="font-weight: bold">Ingreso:</span>
                        <%= Html.Encode(String.Format("{0:g}", Model.FechaIngreso)) %>
                    </p>
                    <p>
                        <span style="font-weight: bold">Tipo de Orden:</span>
                        <%=Html.Encode(Model.TipoOrden1.Descripcion) %>
                    </p>
                </div>
                <div class="three-column-right">
                    <p>
                        <span style="font-weight: bold">Fecha Entrega:</span>
                        <%= Html.Encode(String.Format("{0:d}", Model.FechaEntrega)) %>
                    </p>
                </div>
            </div>
            <div class="clear">
            </div>
            <% if (Model.TipoOrden != 2)
               { %>
            <p>
                <span style="font-weight: bold">Boleta:</span>
                <%= Html.Encode(Model.Boleta)%>
            </p>
            <p>
                <span style="font-weight: bold">Poliza:</span>
                <%= Html.Encode(Model.Poliza)%>
            </p>
            <p>
                <span style="font-weight: bold">Fecha Compra:</span>
                <%= Html.Encode(String.Format("{0:d}", Model.FechaCompra))%>
            </p>
            <p>
                <span style="font-weight: bold">Lugar Compra:</span>
                <%= Html.Encode(Model.LugarCompra)%>
            </p>
            <%} %>
            <p>
                <span style="font-weight: bold; display: block;">Falla:</span>
                <%= Html.Encode(Model.Falla) %>
            </p>
            <p>
                <span style="font-weight: bold; display: block;">Condici&oacute;n <%=Html.Encode("Artículo")%>:</span>
                <%= Html.Encode(Model.CondicionArticulo) %>
            </p>
        </div>
    </fieldset>
    <%if (Model.Detalles.Count() > 0)
      { %>
    <fieldset>
        <legend>Detalles</legend>
        <div class="detalle">
            <%foreach (var detalle in Model.Detalles.OrderByDescending(x => x.FechaCreacion))
              {%>
            <p>
                <%if (!detalle.Usuario.esSistema())
                  {%>
                <span style="font-weight: bold;">Usuario:</span> <span style="margin-right: 15px;">
                    <%=Html.Encode(detalle.Usuario.NombreCompleto)%>
                </span>
                <%} %>
                <span style="font-weight: bold">Fecha:</span>
                <%=Html.Encode(string.Format("{0:g}",detalle.FechaCreacion)) %>
            </p>
            <p>
                <span style="font-weight: bold">Estado:</span>
                <%=Html.Encode(detalle.Estado1.Descripcion) %>
                <br />
                <%=Html.Encode(detalle.Contenido) %>
            </p>
            <hr />
            <%} %>
            
        </div>
    </fieldset>
    <%} %>
</div>