<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.OrdenTrabajo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
        <h2>Orden de Trabajo</h2>
         <div class="three-column-container">
                <div class="three-column-left">
        
        <p>
            <%=Html.Encode("Número de Orden:") %>
            <%= Html.Encode(String.Format("{0}", Model.Id)) %>
        </p>
        </div>
        <div class="three-column-middle">
        &nbsp;
        </div>
        <div class="three-column-right">
        <p>
            Fecha:
            <%= Html.Encode(String.Format("{0:g}", Model.FechaIngreso)) %>
        </p>
        </div>
        </div>
        <div class="clear"></div>
         <div class="three-column-container">
                <div class="three-column-left">
         <p>
            Cliente:
            <br />
             <%= Html.Encode(String.Format("{0} {1}", Model.Cliente.ClienteParticular.Nombre,Model.Cliente.ClienteParticular.ApellidoPaterno)) %>
        </p>
        </div>
        <div class="three-column-middle">
        
        <p>
        
            Rut :
            <br />
            <%= Html.Encode(String.Format("{0}", Model.Cliente.ClienteParticular.Rut.GetRutCompleto())) %>
        
        </p>
        </div>
        </div>
        <div class="clear"></div>
        <p>
            Fecha Entrega:
            <%= Html.Encode(String.Format("{0:d}", Model.FechaEntrega)) %>
        </p>
     
     <div class="clear"></div>
        <h2><%=Html.Encode("Artículo:")%></h2>        
        <div class="three-column-container">
            <div class="three-column-left">
           <p>
            Modelo: <%= Html.Encode(String.Format("{0}", Model.Articulo.Modelo)) %>
            </p>
            </div>
            <div class="three-column-middle">
            <p>
            Marca: <%= Html.Encode(String.Format("{0}", Model.Articulo.Marca1.Descripcion)) %>
            <p>
            </div>
            <div class="three-column-right">
            <p> 
            <%=Html.Encode("Línea")%>: <%= Html.Encode(String.Format("{0}", Model.Articulo.Linea1.Descripcion)) %>
            </p>
            </div>
            </div>
        <p>
            Serie:
            <%= Html.Encode(Model.Serie) %>
        </p>

        <p>
            Falla:
            <%= Html.Encode(Model.Falla) %>
        </p>
        <p>
            <%=Html.Encode("Condición Artículo:")%>:
            <%= Html.Encode(Model.CondicionArticulo) %>
        </p>
        <p>
            Tipo de Orden:
            <%=Html.Encode(Model.TipoOrden1.Descripcion) %>
        </p>
        
            <% if (Model.TipoOrden != 2)
               { %>

        <p>
            Boleta:
            <%= Html.Encode(Model.Boleta)%>
        </p>
        <p>
            <%=Html.Encode("Póliza") %>:
            <%= Html.Encode(Model.Poliza)%>
        </p>
        <p>
            Fecha Compra:
            <%= Html.Encode(String.Format("{0:d}", Model.FechaCompra))%>
        </p>
        <p>
            Lugar Compra:
            <%= Html.Encode(Model.LugarCompra)%>
        </p>
        <%} %>
        
         <%if(Model.Detalles.Count() > 0){ %>
        
        <h2>Detalles</h2>
        
        <%foreach (var detalle in Model.Detalles.OrderByDescending(x => x.FechaCreacion))
          {%>
          
          <p>Fecha:
          <%=Html.Encode(string.Format("{0:g}",detalle.FechaCreacion)) %>
          </p>
          
          <p>Estado:
           <%=Html.Encode(detalle.Estado1.Descripcion) %>
           <br />
           <%=Html.Encode(detalle.Contenido) %> 
           </p>
          <%} %>
        
        
        <%} %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
   
    <ul>
        <li><%=Html.ActionLink("Agregar Detalle", "AgregarDetalle", new {id=Model.Id})%></li>
        <li><a href="javascript:window.print()">Imprimir</a></li>
        <li><%=Html.ActionLink("Exportar a Excel","Detalles",new {id=Model.Id,format="xls"}) %></li>
    </ul>
</asp:Content>
