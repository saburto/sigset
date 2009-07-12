<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>

    <h2>
    <%= Html.Encode(Model.Nombre) %> <%= Html.Encode(Model.Apellido_Paterno) %> <%= Html.Encode(Model.Apellido_Materno) %>
    </h2>  

