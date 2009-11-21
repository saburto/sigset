<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.TipoArticulo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Tipo de Articulos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Tipo de Articulos</h2>
    <%=Html.ValidationSummary() %>
      <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                Editar
            </th>
            <th>
                 Descripci&oacute;n
            </th>
            <th>Eliminar</th>
        </tr>
    <%bool alter = false; %>
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
            <td>
                <div class="disp display<%=item.IdTipoArticulo %>">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.pencil,IconPosition.solo, new{ onclick="mostrar("+ item.IdTipoArticulo +")", title="Editar Tipo de Articulo" }) %>
                </div>
                <div class="formu form<%=item.IdTipoArticulo %>" style="display:none;">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.minus,IconPosition.solo, new{ onclick="esconder("+ item.IdTipoArticulo +")", title="Cancelar Edición" }) %>
                    <%=Html.ButtonLinkIcon("#","Guardar",Iconos.disk,IconPosition.solo, new{ onclick="submit("+ item.IdTipoArticulo +")", title="Guardar Modificación" }) %>
                </div>
            </td>
            <td>
                <div id="disp<%=item.IdTipoArticulo %>" class="disp display<%=item.IdTipoArticulo %>" >
                    <%= Html.Encode(item.Descripcion) %>
                </div>
                
                <%using (Html.BeginForm("Guardar", "TipoArticulo", FormMethod.Post, new { id = "formuEsp" + item.IdTipoArticulo }))
                  { %>
                        <div class="formu form<%=item.IdTipoArticulo %>" style="display:none;">
                            <input type="hidden" name="IdTipoArticulo" value="<%=item.IdTipoArticulo %>" />
                            <%=Html.TextBox("Descripcion" + item.IdTipoArticulo, item.Descripcion, new { @class = "required" })%>  
                        </div>
                <%} %>
            </td>
            <td>
                <%=Html.ButtonLinkIcon("#","Elimnar",Iconos.cancel,IconPosition.solo, new{ onclick="elimnar('"+ item.IdTipoArticulo +"')", title="Elimnar tipo de articulo" }) %>
            </td>
        </tr>
    
    <% } %>
    </table>
    <p>
        <%=Html.ButtonLinkIcon("#","Nueva Tipo Articulo", Iconos.circle_plus, IconPosition.left, new{title="Agregar nuevo tipo de articulo", onclick="abrirNuevo()"}) %>
    
    </p>
    <div id="nuevo" style="font-size:80%;" title="Nueva Tipo Articulo" >
        <%Html.RenderPartial("Crear"); %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
.data-table input
{
    font-size:1.2em;
}


</style>

<script type="text/javascript">
//<![CDATA[

    $(function() {
    $("#nuevo").dialog({
        
        autoOpen: false

        
        });

    });

    function abrirNuevo() {
        $("#nuevo").dialog('open');
        return false;
    }

    function elimnar(id) {
        if (confirm("¿Esta seguro de elimnar este tipo de articulo?")) {
            var $formu = $("#formuEsp" + id)
            $formu.removeAttr("action");
            $formu.attr("action", '<%=Url.Action("Eliminar", "TipoArticulo") %>');
            $formu.submit();
        }
        return false;
    }
    
    
    function submit(id) {
        if ($("#Descripcion" + id).valid()) {
            $("#formuEsp" + id).submit();
        }
    }

    function esconderTodo() {
        $(".formu").hide();
        $(".formu input").attr("disabled", "disabled");
        $(".disp").show();
    }

    function mostrar(id) {

        esconderTodo();
        $(".display" + id).hide();
        $(".form" + id + " input").removeAttr("disabled");
        $(".form" + id).show();
    }

    function esconder(id) {
        $("#Descripcion" + id).val($("#disp" + id).html().trim());
        $(".display" + id).show();
        $(".form" + id).hide();
    }

//]]>
</script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

