<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Articulo>" %>

<fieldset>
<legend><%=Html.Encode("Art�culo")%></legend>
<div class="three-column-container" style="font-size:75%;">
       <div class="three-column-left">            
       <p>
         <span style="font-weight:bold">Modelo:</span>
            <%= Html.Encode(Model.Modelo) %>
            <br />
            <span style="font-weight:bold">Marca:</span>
            <%= Html.Encode(Model.Marca1.Descripcion) %>
            <br />
            <span style="font-weight:bold"><%=Html.Encode("L�nea")%>:</span>
            <%= Html.Encode(Model.Linea1.Descripcion) %>
        </p>

       </div>
       
       <div class="three-column-middle">
        <p>
            <span style="font-weight:bold">Tipo <%=Html.Encode("Art�culo")%>:</span>
            <%= Html.Encode(Model.TipoArticulo1.Descripcion) %>
            <br />
            <span style="font-weight:bold"><%=Html.Encode("Categor�a")%>:</span>
            <%= Html.Encode(Model.Categoria1.Descripcion) %>
        </p>
       </div>
       
       <div class="three-column-right">
       <p>
            <span style="font-weight:bold">Precio <%=Html.Encode("Garant�a")%>:</span>
            <br />
            <%= Html.Encode("Reparaci�n: $" + Model.PrecioGarantia1.ValorReparacion) %>
            <br />
            <%= Html.Encode("Revisi�n: $" + Model.PrecioGarantia1.ValorRevision) %>
       </p>
       </div> 
</div>
<div class="clear"></div>       
</fieldset>