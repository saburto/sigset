<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Contacto>" %>
<p>
    <%= Html.Encode(Model.TipoContacto1.Descripcion) %> : <%= Html.Encode(Model.ValorContacto) %>
</p>



