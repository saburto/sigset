<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Permiso>" %>



    <p>
        Id:
        <%= Html.Encode(Model.Id) %>
    </p>
    <p>
        <%= Html.Encode("M�dulo:") %>
        <%= Html.Encode(Model.Modulo.DescripcionOpcion) %>
    </p>
    <p>
        <%= Html.Encode("Opci�n:") %>
        <%= Html.Encode(Model.Opcion) %>
    </p>
    <p>
        <%= Html.Encode("Descripci�n Opci�n:") %>
        <%= Html.Encode(Model.DescripcionOpcion) %>
    </p>

