<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>
   <fieldset>
   <legend>Cliente</legend>
   <div class="two-column-container" style="font-size:80%">
        <div class="two-column-left">
            <p>
                
    <%if(Model.TipoCliente == (int) Data.Modelo.Enums.TipoClientes.ClienteParticular){ %>
        Nombre:<br />
       <%= Html.Encode(Model.ClienteParticular.Nombre) %> <%= Html.Encode(Model.ClienteParticular.ApellidoPaterno) %> <%= Html.Encode(Model.ClienteParticular.ApellidoMaterno) %>
    <%}
      else if (Model.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteComercial)
      { %>
        Raz&oacute;n Social:<br />
        <%= Html.Encode(Model.ClienteComercial.RazonSocial) %>
        <%if(Model.ClienteComercial.Sucursal.isNotNull()){ %>
        <br />
        Sucursal <%=Html.Encode(Model.ClienteComercial.Sucursal) %>
    <%} %>
    <%} %>
            </p>
        </div>
        <div class="two-column-right">
            <p>
                Rut :
                <br />
                <%if(Model.TipoCliente == (int) Data.Modelo.Enums.TipoClientes.ClienteParticular){ %>
                    <%= Html.Encode(String.Format("{0}", Model.ClienteParticular.Rut.GetRutCompleto())) %>
                <%}
                else if (Model.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteComercial)
                { %>
                    <%= Html.Encode(String.Format("{0}", Model.ClienteComercial.Rut.GetRutCompleto())) %>
                <%} %>
            </p>
        </div>
    </div>
    <div class="clear"></div>
    </fieldset>