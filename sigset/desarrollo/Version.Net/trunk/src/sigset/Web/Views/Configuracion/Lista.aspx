<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Configuracion>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de Configuraci&oacute;n
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Lista de Configuraci&oacute;n</h2>

<%=Html.ValidationSummary() %>
    <table border="0" cellpadding="0" cellspacing="0" class="data-table">
        <tr>
            <th>
                Editar
            </th>
            <th>
                Valor
            </th>
            <th>
                Descripci&oacute;n
            </th>
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
                <div class="disp display<%=item.Id %>">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.pencil,IconPosition.solo, new{ onclick="mostrar("+ item.Id +")", title="Editar opción de configuración" }) %>
                </div>
                <div class="formu form<%=item.Id %>" style="display:none;">
                    <%=Html.ButtonLinkIcon("#","Editar",Iconos.minus,IconPosition.solo, new{ onclick="esconder("+ item.Id +")", title="Cancelar edición" }) %>
                    <%=Html.ButtonLinkIcon("#","Guardar",Iconos.disk,IconPosition.solo, new{ onclick="submit("+ item.Id +")", title="Guardar modificación" }) %>
                </div>
            </td>
            <td>
                
                <div id="disp<%=item.Id %>" class="disp display<%=item.Id %>" >
                <%if (Services.Configuraciones.Configuracion.EsConfiguracionBoolean(item.Id))
                  {%>
                    <%=Html.CheckBox("displa", item.Valor.Contains("true"), new { disabled = "disabled" })%>
                 <%}
                  else
                  {%>
                        <%= Html.Encode(item.Valor)%>
                <%} %>
                </div>
                
                <%using (Html.BeginForm("Editar", "Configuracion", FormMethod.Post, new { id="formuConfig" + item.Id }))
                  { %>
                <div class="formu form<%=item.Id %>" style="display:none;">
                    <%= Html.Hidden("Id", item.Id)%>
                    
                    <%if (Services.Configuraciones.Configuracion.EsConfiguracionBoolean(item.Id))
                      { %>
                      <%=Html.CheckBox("Valor" + item.Id, item.Valor.Contains("true"), new { title="Activar/Desactivar opción de configuración" })%>
                    <%}else if(Services.Configuraciones.Configuracion.EsConfiguracionNumerico(item.Id)) {%>
                    <%=Html.TextBox("Valor" + item.Id, item.Valor, new { @class = "required digits", title="Editar valor de tipo númerico" })%>  
                      <%}else
                      {%>
                    <%=Html.TextBox("Valor" + item.Id, item.Valor, new { @class = "required", title="Editar valor" })%>  
                    <%} %>
                </div>
                <%} %>
            </td>
            <td>
                <%= Html.Encode(item.Descripcion) %>
            </td>
        </tr>
    <% } %>
        <tr>
            
            <td>
                <%using(Html.BeginForm("Logo", "Configuracion", FormMethod.Post, new {enctype="multipart/form-data"})){ %>
                <span class="ui-icon-folder-open ui-icon"  style="position:absolute;margin-left:10px;z-index:0"></span>
                <input type="file" name="Imagen" class="realupload" onchange="this.form.submit()" />
                <%} %>
            </td>
            <td>
                <%=Html.ImagenLogo(35,100) %>
            </td>
            <td>Logo empresa</td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
.realupload {
/*	position:absolute;
	top:0;
	right:0;*/

	/* start of transparency styles */
	opacity:0;
	-moz-opacity:0;
	filter:alpha(opacity:0);
	/* end of transparency styles */

	z-index:999; /* bring the real upload interactivity up front */
	width:70px;
}    
    
    
.data-table input
{
    font-size:1.2em;
}


</style>

<script type="text/javascript">
//<![CDATA[

    function submit(id) {
        if ($("#Valor" + id).valid()) {
            $("#formuConfig" + id).submit();
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
        $("#Valor" + id).val($("#disp" + id).html().trim());
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

