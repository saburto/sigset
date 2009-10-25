<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Cliente>" %>

    <h2>
    <%= Html.Encode(Model.Nombre) %> <%= Html.Encode(Model.ApellidoPaterno) %> <%= Html.Encode(Model.ApellidoMaterno) %>
    </h2>  

