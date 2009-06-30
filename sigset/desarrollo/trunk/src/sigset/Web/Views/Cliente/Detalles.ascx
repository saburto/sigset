<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>

        <h2>Cliente</h2>
        <p>
            Rut:
            <%= Html.Encode(Model.Rut) %>
        </p>
        <p>
            Nombre:
            <%= Html.Encode(Model.Nombre) %> <%= Html.Encode(Model.Apellido_Paterno) %> <%= Html.Encode(Model.Apellido_Materno) %>
        </p>
        <p>
            <%=Ajax.ActionLink("Editar", "Editar", "Cliente", new { rut = Model.Rut }, new AjaxOptions { LoadingElementId="loadingAjax", UpdateTargetId="datosCliente" })%>
        </p>
    

