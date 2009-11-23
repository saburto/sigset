<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.PrecioGarantia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Precio Garantia
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
                 Valor Revisi&oacute;n
            </th>
            <th>
                 Valor Reparaci&oacute;n
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
                <div class="disp display<%=item.IdPrecioGarantia %>">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.pencil,IconPosition.solo, new{ onclick="mostrar("+ item.IdPrecioGarantia +")", title="Editar Precio Garantia" }) %>
                </div>
                <div class="formu form<%=item.IdPrecioGarantia %>" style="display:none;">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.minus,IconPosition.solo, new{ onclick="esconder("+ item.IdPrecioGarantia +")", title="Cancelar Edición" }) %>
                    <%=Html.ButtonLinkIcon("#","Guardar",Iconos.disk,IconPosition.solo, new{ onclick="submit("+ item.IdPrecioGarantia +")", title="Guardar Modificación" }) %>
                </div>
            </td>
            <td>
                <div id="disp<%=item.IdPrecioGarantia %>" class="disp display<%=item.IdPrecioGarantia %>" >
                    <%= Html.Encode(string.Format("{0:C0}", item.ValorRevision)) %>
                </div>
                
                <%using (Html.BeginForm("Guardar", "PrecioGarantia", FormMethod.Post, new { id = "formuEsp" + item.IdPrecioGarantia }))
                  { %>
                        <div class="formu form<%=item.IdPrecioGarantia %>" style="display:none;">
                            <input type="hidden" name="IdPrecioGarantia" value="<%=item.IdPrecioGarantia %>" />
                            <%=Html.TextBox("ValorRv" + item.IdPrecioGarantia, item.ValorRevision, new { @class = "required digits " })%>  
                            <input type="hidden" name="ValorRp<%=item.IdPrecioGarantia%>" value="" />
                        </div>
                <%} %>
            </td>
            <td>
                <div id="disp<%=item.IdPrecioGarantia %>" class="disp display<%=item.IdPrecioGarantia %>" >
                    <%= Html.Encode(string.Format("{0:C0}", item.ValorReparacion)) %>
                </div>
                
                <div class="formu form<%=item.IdPrecioGarantia %>" style="display:none;">
                    <form method="post" action="" id="formu2<%=item.IdPrecioGarantia %>">
                        <%=Html.TextBox("ValorRp" + item.IdPrecioGarantia, item.ValorReparacion, new { @class = "required digits" })%>  
                    </form>
                </div>
            </td>
            <td>
                <%=Html.ButtonLinkIcon("#","Elimnar",Iconos.close,IconPosition.solo, new{ onclick="elimnar('"+ item.IdPrecioGarantia +"')", title="Elimnar Precio Garantia" }) %>
            </td>
        </tr>
    
    <% } %>
    </table>
    <p>
        <%=Html.ButtonLinkIcon("#","Nueva Precio Garantia", Iconos.circle_plus, IconPosition.left, new{title="Agregar nuevo precio garantia", onclick="abrirNuevo()"}) %>
    
    </p>
    <div id="nuevo" style="font-size:80%;" title="Nueva Precio Garantia" >
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
        if (confirm("¿Esta seguro de elimnar este precio garantia?")) {
            var $formu = $("#formuEsp" + id)
            $formu.removeAttr("action");
            $formu.attr("action", '<%=Url.Action("Eliminar", "PrecioGarantia") %>');
            $formu.submit();
        }
        return false;
    }


    function submit(id) {

        $("#formu2" + id).validate();
        
        if ($("#ValorRp" + id + ", #ValorRv" + id).valid()) {

            $("#formuEsp" + id).find(":input[name=ValorRp" + id + "]" ).val($("#ValorRv" + id).val());
        
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

