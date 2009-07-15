<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Orden_Trabajo>" %>

   


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
            <%= Html.Encode(String.Format("{0:g}", Model.Fecha_Ingreso)) %>
        </p>
        </div>
        </div>
        <div class="clear"></div>
         <div class="three-column-container">
                <div class="three-column-left">
         <p>
            Cliente:
            <br />
             <%= Html.Encode(String.Format("{0} {1}", Model.Cliente.Nombre,Model.Cliente.Apellido_Paterno)) %>
        </p>
        </div>
        <div class="three-column-middle">
        
        <p>
        
            Rut :
            <br />
            <%= Html.Encode(String.Format("{0}", Model.Id_Cliente.GetRutCompleto())) %>
        
        </p>
        </div>
        </div>
        <div class="clear"></div>
        <p>
            Fecha Entrega:
            <%= Html.Encode(String.Format("{0:d}", Model.Fecha_Entrega)) %>
        </p>
     
     <div class="clear"></div>
        <h2>Articulo:</h2>        
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
            Linea: <%= Html.Encode(String.Format("{0}", Model.Articulo.Linea1.Descripcion)) %>
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
            Condicion Articulo:
            <%= Html.Encode(Model.Condicion_Articulo) %>
        </p>
        <p>
            Tipo de Orden:
            <%=Html.Encode(Model.Tipo_Orden1.Descripcion) %>
        </p>
        
            <% if (Model.Tipo_Orden != 2)
               { %>

        <p>
            Boleta:
            <%= Html.Encode(Model.Boleta)%>
        </p>
        <p>
            Poliza:
            <%= Html.Encode(Model.Poliza)%>
        </p>
        <p>
            Fecha Compra:
            <%= Html.Encode(String.Format("{0:d}", Model.Fecha_Compra))%>
        </p>
        <p>
            Lugar Compra:
            <%= Html.Encode(Model.Lugar_Compra)%>
        </p>
        <%} %>
        
        <%if(Model.Detalles.Count() > 0){ %>
        
        <h2>Detalles</h2>
        
        <%foreach (var detalle in Model.Detalles.OrderBy(x => x.Fecha_Creacion))
          {%>
          
          <p>Fecha:
          <%=Html.Encode(string.Format("{0:g}",detalle.Fecha_Creacion)) %>
          </p>
          
          <p>
           <%=Html.Encode(detalle.Usuario.Usuario1)%> <%=Html.Encode(detalle.Detalle1) %> <%=Html.Encode(detalle.Estado1.Descripcion) %>
           </p>
          <%} %>
        
        
        <%} %>