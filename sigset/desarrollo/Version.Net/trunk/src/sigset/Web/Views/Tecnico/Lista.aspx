<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Tecnico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">



<script type="text/javascript">
    //<![CDATA[

    $(function() {
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

    //]]>	    
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista Técnicos Registrados</h2>
     <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th></th>
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
    
                <%= Html.ActionLink("Editar", "Editar", new { id=item.Id }) %> 
                <%= Html.ActionLink("Detalles", "Detalles", new { id=item.Id })%>
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
                <%= Html.Encode(String.Format("{0}", item.Especialidades.Count))%>
                <%}
               else
               { %>
               Sin Especialidad
              <%} %>

            </td>
            <td>
                <%= Html.ButtonLinkIcon(Url.Action("AgregarNuevaEspecialidad"), "Agregar Especialidades", Iconos.circle_plus, IconPosition.left, new{title="Agregar nueva especialidad"})%>
            </td>
    </tr>
    
    <% } %>

    </table>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

