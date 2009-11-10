<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Web.ViewModel.OrdenesTecnicosView>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Lista Ordenes de trabajo sin asignar
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">

<style type="text/css">

.ui-dialog
{
    font-size:60%
}

.tecnico
{
    font-size:60%
}

.ui-dialog .tecnico
{
    font-size:100%
}


</style>

    <script type="text/javascript">
        //<![CDATA[


        $(function() {


            $(".starsDiv").stars({
                inputType: "select",
                disabled: true,
                cancelShow: false


            });

            $("tr:even").addClass("row-alternating");

            $("#tecnicos").dialog({

                position: 'right',
                height: 300,
                width: 170


            });

            $(".tecnico").draggable({
                helper: 'clone',
                revert: true,
                zIndex: 2700,
                containment: 'window',
                appendTo: 'body'

            });

            $(".tecnicoAsignado").each(function(i, e) {
                $(e).droppable({
                    accept: '.tecnico',
                    tolerance: 'pointer',
                    drop: function(ev, ui) {
                        var idTecnico = ui.draggable.find("input:hidden[name='idTecnico']");
                        var imagenTecnico = ui.draggable.find(".imagenUsuario");

                        $(e).html(ui.draggable.find('.nombre').html());

                        $(e).next().empty();

                        $(imagenTecnico).clone().prependTo($(e).next());
                    }
                });
            });

        });

     


        //]]>
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Lista Ordenes de trabajo sin asignar</h2>
    <%Html.RenderPartial("ListaOrdenes", Model.Ordenes); %>
    
        <div id="tecnicos" title="Tecnicos">
        
        <%foreach(var tecnico in Model.Tecnicos){ %>
        
            <div class="tecnico">
                <table class="ui-widget ui-widget-content ui-corner-all" style="border: 3px solid #459E00; height:80px;width:100%; background-color:#FFFFFF !important;">
                    <tr>
                        <td colspan="2" >
                        <span class="nombre ui-widget-header ui-corner-all ui-helper-clearfix" style="text-align:center; font-size:1.2em; color:#459E00;font-weight:bold;font-family:'trebuchet MS',verdana,sans-serif;">
                            <%=Html.Encode(tecnico.Usuario.NombreCompleto) %>
                        </span>
                        <input type="hidden" value="<%=tecnico.Id %>" name="idTecnico" />
                        </td>
                    </tr>
                    <tr>
                        <td  style="padding: 2px;">
                            <%=Html.ImagenUsuario(tecnico.Id, "imagenUsuario", "Usuario", null) %>
                        </td>
                        <td 
                            style="padding: 2px; vertical-align: top; text-align: left; color: #000000">
                            Ordenes:<br />
                            En revision: <%=tecnico.OrdenesEnRevision() %><br />
                            Revisadas: <%=tecnico.OrdenesReparadas() %><br />
                            
                            <div class="starsDiv">
                                <select>
	    			                <%=Html.NivelesTecnicos((int)tecnico.Nivel) %>
        			            </select>
                            </div>
                            
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <%} %>
            
        </div>

</asp:Content>

