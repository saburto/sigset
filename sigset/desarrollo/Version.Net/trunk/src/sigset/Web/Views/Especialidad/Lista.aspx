<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.TipoEspecialidad>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Especialidades
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Especialidades</h2>
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
                <div class="disp display<%=item.IdTipoEspecialidad %>">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.pencil,IconPosition.solo, new{ onclick="mostrar("+ item.IdTipoEspecialidad +")", title="Editar Especialidad" }) %>
                </div>
                <div class="formu form<%=item.IdTipoEspecialidad %>" style="display:none;">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.minus,IconPosition.solo, new{ onclick="esconder("+ item.IdTipoEspecialidad +")", title="Cancelar Edición" }) %>
                    <%=Html.ButtonLinkIcon("#","Guardar",Iconos.disk,IconPosition.solo, new{ onclick="submit("+ item.IdTipoEspecialidad +")", title="Guardar Modificación" }) %>
                </div>
            </td>
            <td>
                <div id="disp<%=item.IdTipoEspecialidad %>" class="disp display<%=item.IdTipoEspecialidad %>" >
                    <%= Html.Encode(item.Descripcion) %>
                </div>
                
                <%using (Html.BeginForm("Guardar", "Especialidad", FormMethod.Post, new { id = "formuEsp" + item.IdTipoEspecialidad }))
                  { %>
                        <div class="formu form<%=item.IdTipoEspecialidad %>" style="display:none;">
                            <input type="hidden" name="IdTipoEspecialidad" value="<%=item.IdTipoEspecialidad %>" />
                            <%=Html.TextBox("Descripcion" + item.IdTipoEspecialidad, item.Descripcion, new { @class = "required" })%>  
                        </div>
                <%} %>
            </td>
            <td>
                <%=Html.ButtonLinkIcon("#","Elimnar",Iconos.cancel,IconPosition.solo, new{ onclick="elimnar('"+ item.IdTipoEspecialidad +"')", title="Elimnar Especialidad" }) %>
            </td>
        </tr>
    
    <% } %>
    </table>
    <p>
        <%=Html.ButtonLinkIcon("#","Nueva Especialidad", Iconos.circle_plus, IconPosition.left, new{title="Agregar nueva especialidad", onclick="abrirNuevo()"}) %>
    
    </p>
    <div id="nuevo" style="font-size:80%;" title="Nueva Especialidad" >
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
        if (confirm("¿Esta seguro de elimnar esta especialidad?")) {
            var $formu = $("#formuEsp" + id)
            $formu.removeAttr("action");
            $formu.attr("action", '<%=Url.Action("Eliminar", "Especialidad") %>');
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

