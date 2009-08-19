<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Contacto>" %>
<p>
    <%= Html.Encode(Model.Tipo_Contacto1.Descripcion) %> : <%= Html.Encode(Model.Valor_Contacto) %>
</p>



