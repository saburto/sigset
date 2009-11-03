<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Permiso>" %>



    <p>
        Id:
        <%= Html.Encode(Model.Id) %>
    </p>
    <p>
        <%= Html.Encode("Módulo:") %>
        <%= Html.Encode(Model.Modulo.DescripcionOpcion) %>
    </p>
    <p>
        <%= Html.Encode("Opción:") %>
        <%= Html.Encode(Model.Opcion) %>
    </p>
    <p>
        <%= Html.Encode("Descripción Opción:") %>
        <%= Html.Encode(Model.DescripcionOpcion) %>
    </p>

