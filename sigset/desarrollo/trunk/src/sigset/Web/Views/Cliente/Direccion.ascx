<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Direccion>" %>
<%if(Model != null){ %>
        <p>
            <%= Html.Encode(Model.Region1.Nombre) %>, <%= Html.Encode(Model.Comuna1.Nombre) %>
        </p>
        <p>
            <%= Html.Encode(Model.Calle) %> <%= Html.Encode(Model.Numero) %>
        </p>
<%} %>

