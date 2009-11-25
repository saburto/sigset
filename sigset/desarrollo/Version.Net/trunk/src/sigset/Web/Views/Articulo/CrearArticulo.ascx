<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<script type="text/javascript">
//<![CDATA[

    function buscarArticulo(link) {
        if ($("#Modelo, #Marca_DISPLAY_TEXT").valid() ) {

            $("#loadingAjax").show();
            $("#resultado").load(link.href, $("#Modelo, #Marca_DISPLAY_TEXT, #IdCliente"), abrirVentana);

        }
        return false;
    }

    function abrirVentana() {
        $("#loadingAjax").hide();
        $('#resultado').dialog('open');
    }

    $(function() {
        $("#resultado").dialog({
            bgiframe: true,
            modal: true,
            autoOpen: false,
            height: 300,
            width: 500

        });

    });
    
//]]>
</script>



        <fieldset>
            <legend>Nuevo <%=Html.Encode("Art�culo")%></legend>
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Modelo">Modelo:</label>
                <%= Html.TextBox("Modelo", null, new { @class = "required", title="Modelo del art�culo" })%>
                <%= Html.ValidationMessage("Modelo", "*") %>
                </div>
                <div class="three-column-middle">
                <label for="Marca">Marca:</label>
                <%= Html.AutoCompleteTextBox("Marca", new { @class = "required", title="Marca a la que pertenece el art�culo, si no existe en la lista se agrega" })%>
                <%= Html.ValidationMessage("Marca", "*") %>
                    <div style="font-size:50%; display:inline !important; float:right;width:46%;position:relative;">
                        <%= Html.ButtonLinkIcon(Url.Action("Buscar", "Articulo"), "Buscar", Iconos.search, IconPosition.solo, new { onclick = "return buscarArticulo(this)", title="Busca seg�n modelo y marca si el art�culo ya esta registrado" })%>
                    </div>
                </div>
                <div class="three-column-right">
                <label for="Linea"><%=Html.Encode("L�nea")%>:</label>
                <%= Html.AutoCompleteTextBox("Linea", new { @class = "required", title="L�nea a la que pertence el modelo" })%>
                <%= Html.ValidationMessage("Linea", "*") %>
                </div>
            </div>
            <br />
            <br />
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Categoria"><%=Html.Encode("Categor�a")%>:</label>
                <%= Html.AutoCompleteTextBox("Categoria", new { @class = "required", title="Categor�a a la que pertence el art�culo" })%>
                <%= Html.ValidationMessage("Categoria", "*") %>                
                </div>
                
                <div class="three-column-middle">
                <label for="TipoArticulo">Tipo <%=Html.Encode("Art�culo")%>:</label>
                <%= Html.AutoCompleteTextBox("TipoArticulo", new { @class = "required", title="Tipo de Art�culo" })%>
                <%= Html.ValidationMessage("TipoArticulo", "*") %>
                </div>
                
                <div class="three-column-right">
                <label for="PrecioGarantia">Precios <%=Html.Encode("Garant�a")%>:</label>
                <%= Html.DropDownList("PrecioGarantia", null, new { @class = "required", title="Precio de revisi�n y reparaci�n del art�culo" })%>
                <%= Html.ValidationMessage("PrecioGarantia", "*") %>
                </div>
            </div>
                <div class="clear"></div>
                <br />
        </fieldset>
         <div id="resultado"  style="display:none" title="Resultado"></div>