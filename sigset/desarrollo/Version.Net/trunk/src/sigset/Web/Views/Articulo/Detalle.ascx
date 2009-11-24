<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Articulo>" %>

<%if(Model != null) {%>
<h2><%=Html.Encode("Art�culo")%> </h2>
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

    <p>
        <% if (ViewData["idCliente"] != null)
           {%>
            <%=Html.ButtonLinkIcon(Url.Action("CrearDetalle","OrdenTrabajo",new { id = Model.Id,idCliente =ViewData["idCliente"]}),"Agregar a Orden de Trabajo",Iconos.circle_plus) %>
        <%} %>
    </p>
<%}else{ %>
    
    <h2><%=Html.Encode("Art�culo")%> no encontrado</h2>
     <% if (ViewData["idCliente"] == null)
     {%>
    <p>
        <%=Html.ButtonLinkIcon(Url.Action("Crear"),"Crear Nuevo Art�culo",Iconos.circle_plus,IconPosition.left) %>
    </p>
     <%} %>
<%} %>