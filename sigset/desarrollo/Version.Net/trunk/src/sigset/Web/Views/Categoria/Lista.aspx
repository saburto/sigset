<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Categoria>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de <%=Html.Encode("Categoría")%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de <%=Html.Encode("Categoría")%></h2>
    <%=Html.ValidationSummary() %>
      <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                Editar
            </th>
            <th>
                 Descripci&oacute;n
            </th>
            <th>
                Especialidad
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
                <div class="disp display<%=item.IdCategoria %>">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.pencil,IconPosition.solo, new{ onclick="mostrar("+ item.IdCategoria +")", title="Editar Categoría" }) %>
                </div>
                <div class="formu form<%=item.IdCategoria %>" style="display:none;">
                    <%=Html.ButtonLinkIcon("#", "Editar", Iconos.minus, IconPosition.solo, new { onclick = "esconder(" + item.IdCategoria + ")", title = "Cancelar Edición" })%>
                    <%=Html.ButtonLinkIcon("#", "Guardar", Iconos.disk, IconPosition.solo, new { onclick = "submit(" + item.IdCategoria + ")", title = "Guardar Modificación" })%>
                </div>
            </td>
            <td>
                <div id="disp<%=item.IdCategoria %>" class="disp display<%=item.IdCategoria %>" >
                    <%= Html.Encode(item.Descripcion) %>
                </div>
                
                <%using (Html.BeginForm("Guardar", "Categoria", FormMethod.Post, new { id = "formuEsp" + item.IdCategoria }))
                  { %>
                        <div class="formu form<%=item.IdCategoria %>" style="display:none;">
                            <input type="hidden" name="IdCategoria" value="<%=item.IdCategoria %>" />
                            <%=Html.TextBox("Descripcion" + item.IdCategoria, item.Descripcion, new { @class = "required", title="Editar descripción de categoría" })%>  
                            <input type="hidden" name="IdTipoEspecialidad" value="" />
                        </div>
                <%} %>
            </td>
            <td>
                <div class="formu form<%=item.IdCategoria %>" style="display:none" >
                
                    <%
           
           
           var lista = ViewData["TipoEspcialidad"] as List<SelectListItem>;
           if (item.IdTipoEspecialidad.HasValue)
           {
               var itemSeleccionado = lista.Where(x => x.Value == item.IdTipoEspecialidad.ToString()).FirstOrDefault();
               if (item != null)
               {
                   itemSeleccionado.Selected = true;
               }
                   
           }
           
           %>
                
                    <%=Html.DropDownList("TipoEspcialidad",lista, new { id = "TipoEspcialidad" + item.IdCategoria, title="Relacionar categoría con especialidad" })%>
                </div>
                <div class="disp display<%=item.IdCategoria %>">
                    <%if (item.TipoEspecialidad != null){ %>
                    <%=Html.Encode(item.TipoEspecialidad.Descripcion) %>
                    <%}else{ %>
                        Sin Especialidad Asociada
                    <%} %>
                </div>
            </td>
            <td>
                <%=Html.ButtonLinkIcon("#", "Eliminar", Iconos.close, IconPosition.solo, new { onclick = "elimnar('" + item.IdCategoria + "')", title = "Eliminar Categoría" })%>
            </td>
        </tr>
    
    <% } %>
    </table>
    <%=Html.Paginador() %>
    <p>
        <%=Html.ButtonLinkIcon("#","Nueva Categoría", Iconos.circle_plus, IconPosition.left, new{title="Agregar nueva categoría", onclick="abrirNuevo()"}) %>
    
    </p>
    <div id="nuevo" style="font-size:80%;" title="Nueva Categoría" >
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
        if (confirm("¿Esta seguro de elimnar esta categoaria?")) {
            var $formu = $("#formuEsp" + id)
            $formu.removeAttr("action");
            $formu.attr("action", '<%=Url.Action("Eliminar", "Categoria") %>');
            $formu.submit();
        }
        return false;
    }
    
    
    function submit(id) {
        if ($("#Descripcion" + id).valid() && $("#TipoEspcialidad" + id).val() != "-1") {

            var $formu = $("#formuEsp" + id);
            $formu.find(":input[name='IdTipoEspecialidad']").val($("#TipoEspcialidad" + id).val());
            $formu.submit();
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
    <%=Html.ImagenFondo("icons", "Tag.png")%>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

