<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Tecnico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<link href="<%= Url.Content("~/Content/starts/ui.starts.css") %>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%= Url.Content("~/Scripts/ui.starts.min.js") %>"></script>


<script type="text/javascript">
    //<![CDATA[

    $(function() {
        $("#nivel").children().not("select").hide();

        // Create target element for onHover titles
        $caption = $("<span/>");

        $("#nivel").stars({
            inputType: "select",
            captionEl: $caption, // point to our newly created element
            callback: function(ui, type, value) {

                alert(value);
                /*$.post("demo2.php", { rate: value }, function(data) {
                $("#ajax_response").html(data);
                });*/
            }

        });

        // Make it available in DOM tree
        $caption.appendTo("#nivel");
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
		        <form id="nivel" method="post">

			        <select name="rate">
				        <option value="1">Very poor</option>
				        <option value="2">Not that bad</option>
				        <option value="3">Average</option>
				        <option value="4">Good</option>

				        <option value="5">Perfect</option>
			        </select>

			        <input type="submit" value="Rate it!" />

		        </form>
                <%= Html.Encode(item.Nivel1.Descripcion)%>
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
                <%= Html.ActionLink("Agregar Especialidades", "AgregarEspecialidades" , new { id=item.Id }) %>
            </td>
    </tr>
    
    <% } %>

    </table>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

