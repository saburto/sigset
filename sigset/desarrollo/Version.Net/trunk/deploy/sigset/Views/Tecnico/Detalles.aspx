<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Tecnico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= Html.Encode("Detalles Técnico") %></h2>

    <fieldset>
    <legend>Datos Basico</legend>
        <p>
            Nombre:
            <%= Html.Encode(Model.Usuario.Nombres + " " + Model.Usuario.ApellidoPaterno + " " + Model.Usuario.ApellidoMaterno) %>
        </p>
        <p>
            Rut:
            <%= Html.Encode(String.Format("{0}", Model.Usuario.Rut.GetRutCompleto())) %>
        </p>
            <table>
            <tr>
            <td >
             <p>Nivel:</p>
            </td>
            <td valign="top">
                <div style="display:inline-block;">
                    <form id="nivel"  method="post" action="<%=Url.Action("Nivel", "Tecnico")%>">
		                    <select name="<%=Model.Id %>">
				                <%=Html.NivelesTecnicos((int)Model.Nivel) %>
			                </select>
	                </form>
	                
	            </div>
	            <span id="desc" ></span>
	        </td>
	        <td >
	        <p>
	            
	        </p>
	        </td>
	        </tr>
	        </table>
        <p style="display:inline">
            Especialidades:
                <% foreach (var item in Model.Especialidades) {%>
                        <%= Html.Encode(item.TipoEspecialidad1.Descripcion) %><%if (!Model.Especialidades.Last().Equals(item))
                          { %>, <%}%>
               <%} %>
        <span>
        <div id="masEsp" style="display:inline; font-size:90%">
            <%= Html.ButtonLinkIcon(Url.Action("AgregarNuevaEspecialidad", new {id=Model.Id }), "Agregar", Iconos.circle_plus, IconPosition.left, new { onclick = "return abrirEspc(this)", title = "Agregar nueva especialidad" })%>
        </div></span>  
        </p>
        <br />
  </fieldset>  
  <p>
     <%= Html.ButtonLinkIcon(Url.Action("Editar", "Usuario", new { id = Model.Id }), "Editar Usuario", Iconos.pencil, IconPosition.left, new { title = "Editar Usuario" })%> 
  </p>
  <br />
  <br />  
<fieldset>
<legend>Ordenes de Trabajo</legend>
        <div id="tabs">
        	<ul>
		        <li><a href="#tabs-1">Asignadas</a></li>
		        <li><a href="#tabs-2">En revisi&oacute;n</a></li>
		        <li><a href="#tabs-4">En reparaci&oacute;n</a></li>
		        <li><a href="#tabs-3">Reparadas</a></li>
	        </ul>
	        <div id="tabs-1">
		         <%Html.RenderPartial("../Administrativos/ListaOrdenes", Model.GetOrdenesAsignadas()); %>
	        </div>
	        <div id="tabs-2">
		         <%Html.RenderPartial("../Administrativos/ListaOrdenes", Model.GetOrdenesEnRevision()); %>
	        </div>
	        <div id="tabs-4">
		         <%Html.RenderPartial("../Administrativos/ListaOrdenes", Model.GetOrdenesEnReparacion()); %>
	        </div>
	        <div id="tabs-3">
		         <%Html.RenderPartial("../Administrativos/ListaOrdenes", Model.GetOrdenesReparados()); %>
	        </div>
        </div>..
</fieldset>


    <div id="resultado"  style="display:none" title="Especialidades"></div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">

#masEsp a.fg-button
{
    float:inherit;
    display:inline;
}


fieldset p, #desc
{
    font-size:80%;
}

#resultado p
{
    font-size:100%;
}

.fg-button
{
    font-size:80%;
}

</style>


<script type="text/javascript">
//<![CDATA[

    $(function() {

    $("#tabs").tabs();

    $("#resultado").dialog({
        bgiframe: true,
        modal: false,
        autoOpen: false,
        height: 380,
        width: 500

    });
    
    

            $("#nivel").children().not("select").hide();    
             $("#nivel").stars({
                inputType: "select",
                cancelShow: false,
                captionEl: $("#desc"),
                callback: function(ui, type, value) {

                    $.post($('#nivel').attr('action'), { idTecnico: this.name, idNivel: value });
                }

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

//]]>	    
</script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

