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


                        //AsignarTecnico(int idOrden, int idTecnico)
                        $.post('<%=Url.Action("AsignarTecnico") %>', { idOrden: e.id, idTecnico: idTecnico.val() },
                         function(data) {
                             
                             $(e).html(ui.draggable.find('.nombre').html());

                             $(e).next().empty();

                             $(imagenTecnico).clone().prependTo($(e).next());
                             
                             }
                         );



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
    
    <%Html.RenderPartial("ListaTecnicos", Model.Tecnicos); %>
    
      

</asp:Content>

