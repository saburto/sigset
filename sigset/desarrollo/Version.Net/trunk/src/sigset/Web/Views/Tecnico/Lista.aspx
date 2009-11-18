<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Tecnico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">



<script type="text/javascript">
    //<![CDATA[

    $(function() {

        $("#resultado").dialog({
            bgiframe: true,
            modal: false,
            autoOpen: false,
            height: 380,
            width: 500

        });
    
    
        $(".nivel").children().not("select").hide();

        // Create target element for onHover titles


        $.each($(".nivel"), function(i, e) {


            $(e).stars({
                inputType: "select",
                cancelShow: false,
                captionEl: $("#desc" + e.id),
                callback: function(ui, type, value) {

                    $.post($('.nivel').attr('action'), { idTecnico: this.name, idNivel: value });
                }

            });
                

        });
    });

    function abrirEspc(link) {
        $("#loadingAjax").show();
        $("#resultado").load(link.href, abrirVentana);
        return false;
    }

    function abrirVentana() {
        $("#loadingAjax").hide();
        $('#resultado').dialog('open');
    }

    function VerEspcialidad(idTecnico) {
        $('#Especialidades' + idTecnico).toggle();
    } 

    //]]>	    
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista Técnicos Registrados</h2>
     <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>Edtar</th>
            <th>Detalles</th>
            <th>
                Rut
            </th>
            <th>
                Nombre
            </th>
            <th>
                Nivel
            </th>
            <th>
                Especialidades
            </th>
             <th>
                Agregar Especialidades
            </th>
        </tr>

   <% bool alter = false; %>
    <% foreach (var item in Model)
       { %>
    <%if (alter)
      { %>
        <tr class="row-alternating">
    <%}
      else
      { %>
      
        <tr>
    <%} alter = !alter; %>
       
            <th scope="row">
                <%= Html.ButtonLinkIcon(Url.Action("Editar", "Usuario", new { id = item.Id }), "Editar", Iconos.pencil, IconPosition.solo, new { title = "Editar Usuario" })%> 
            </th>                
            <th scope="row">
                <%= Html.ButtonLinkIcon(Url.Action("Detalles", "Tecnico", new { id = item.Id }), "Detalles", Iconos.zoomin, IconPosition.solo, new { title = "Ver detalles de Usuario" })%> 
            </th>
            
            <td>
                <%= Html.Encode(String.Format("{0}", ((decimal)(item.Usuario.Rut)).GetRutCompleto())) %>
            </td>
            <td>
                <%= Html.Encode( item.Usuario.Nombres + " " ) %>
                <%= Html.Encode(item.Usuario.ApellidoPaterno + " ")%>
                <%= Html.Encode( item.Usuario.ApellidoMaterno) %>
                
            </td>
            <td>
                <form id="<%=item.Id %>"  class="nivel" method="post" action="<%=Url.Action("Nivel", "Tecnico")%>">
		            <select name="<%=item.Id %>">
				        <%=Html.NivelesTecnicos((int)item.Nivel) %>
			        </select>
	            </form>
	            <span id="desc<%=item.Id %>" ></span>
            </td>
                <td>
             <%if (item.Especialidades != null && item.Especialidades.Count > 0)
               { %>
                
                <%=Html.ButtonLinkIcon("javascript:VerEspcialidad('" + item.Id + "');", "Ver", Iconos.zoomin, IconPosition.solo, new { title="Ver Especialidades del Tecnico" })%>
                <br />
                <div id="Especialidades<%=item.Id %>" style="display:none">
                
                
                
                <%foreach (var es in item.Especialidades)
                  {%>
                  <br />
                  -<%=es.TipoEspecialidad1.Descripcion %>
                  
                  <%} %>
                
                </div>
                <%}
               else
               { %>
               Sin Especialidad
              <%} %>

            </td>
            <td>
                <p>
                    <%= Html.ButtonLinkIcon(Url.Action("AgregarNuevaEspecialidad", new {id=item.Id }), "Agregar Especialidad", Iconos.circle_plus, IconPosition.solo, new { onclick = "return abrirEspc(this)", title = "Agregar nueva especialidad" })%>
                </p>
            </td>
    </tr>
    
    <% } %>
    </table>
    
    <div id="resultado"  style="display:none" title="Especialidades"></div>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

