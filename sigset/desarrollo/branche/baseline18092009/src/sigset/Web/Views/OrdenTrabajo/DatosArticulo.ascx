<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Articulo>" %>

<h2>Articulo</h2>
<div class="three-column-container">
       <div class="three-column-left">            
       <p>
         <span style="font-weight:bold">Modelo:</span>
            <%= Html.Encode(Model.Modelo) %>
            <br />
            <span style="font-weight:bold">Marca:</span>
            <%= Html.Encode(Model.Marca1.Descripcion) %>
            <br />
            <span style="font-weight:bold">Linea:</span>
            <%= Html.Encode(Model.Linea1.Descripcion) %>
        </p>

       </div>
       
       <div class="three-column-middle">
        <p>
            <span style="font-weight:bold">Tipo Articulo:</span>
            <%= Html.Encode(Model.Tipo_Articulo1.Descripcion) %>
            <br />
            <span style="font-weight:bold">Categoria:</span>
            <%= Html.Encode(Model.Categoria1.Descripcion) %>
        </p>
       </div>
       
       <div class="three-column-right">
       <p>
            <span style="font-weight:bold">Precio Garantia:</span>
            <br />
            <%= Html.Encode("Reparaci�n: $" + Model.Precio_Garantia1.Valor_Reparacion) %>
            <br />
            <%= Html.Encode("Revisi�n: $" + Model.Precio_Garantia1.Valor_Revision) %>
       </p>
       </div> 
</div>
<div class="clear"></div>       