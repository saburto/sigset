<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.OrdenTrabajo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Lista Ordenes de trabajo sin asignar
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Lista Ordenes de trabajo sin asignar</h2>
    <%Html.RenderPartial("ListaOrdenes", Model); %>
    <div id="tecnicos" title="Tecnicos">
        <div class="tecnico">
            <img style="width: 64px; height: 64px;" src="../../Content/icons/Buddy.png" alt="Usuario" />Juan 1
        </div>
        <div class="tecnico">
            <img style="width: 64px; height: 64px;" src="../../Content/icons/Buddy.png" alt="Usuario" />Juan 2
        </div>
        <div class="tecnico">
            <img style="width: 64px; height: 64px;" src="../../Content/icons/Buddy.png" alt="Usuario" />Juan 3
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">
        //<![CDATA[

        $(function() {

            $("tr:even").addClass("row-alternating");

            $("#tecnicos").dialog({

                position: 'right',
                height: 500


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
                    drop: function(ev, ui) {
                        $(e).html(ui.draggable.clone());
                    }
                });
            });

        });




        //]]>
    </script>

</asp:Content>
