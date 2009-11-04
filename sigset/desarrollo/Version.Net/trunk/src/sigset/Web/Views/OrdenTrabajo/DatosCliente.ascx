<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>

    <h2>
    <%if(Model.TipoCliente == (int) Data.Modelo.Enums.TipoClientes.ClienteParticular){ %>
       <%= Html.Encode(Model.ClienteParticular.Nombre) %> <%= Html.Encode(Model.ClienteParticular.ApellidoPaterno) %> <%= Html.Encode(Model.ClienteParticular.ApellidoMaterno) %>
    <%}
      else if (Model.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteComercial)
      { %>
        <%= Html.Encode(Model.ClienteComercial.RazonSocial) %>
        <%if(Model.ClienteComercial.Sucursal.isNotNull()){ %>
        , Sucursal <%=Html.Encode(Model.ClienteComercial.Sucursal) %>
    <%} %>
    <%} %>
    </h2>  

