<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Empleado>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear</h2>

    <%= Html.ValidationSummary("No se puede Crear Nuevo Empleado. Favor corrija los errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Datos Personales:</legend>
             <div class="three-column-container">
            <div class="three-column-left">
            <p>
                <label for="Rut">Rut:</label>
                <%= Html.RutTextBox()%>
                <%= Html.ValidationMessage("Rut", "*") %>
            </p>
             <p>
                <label for="Apellido_Paterno">Apellido Paterno:</label>
                <%= Html.TextBox("Apellido_Paterno") %>
                <%= Html.ValidationMessage("Apellido_Paterno", "*") %>
            </p>
            </div>
            <div class="three-column-middle">
            <p>
                <label for="Nombre">Nombre:</label>
                <%= Html.TextBox("Nombre") %>
                <%= Html.ValidationMessage("Nombre", "*") %>
            </p>
           
            <p>
                <label for="Apellido_Materno">Apellido Materno:</label>
                <%= Html.TextBox("Apellido_Materno") %>
                <%= Html.ValidationMessage("Apellido_Materno", "*") %>
            </p>
            </div>
            <div class="clear"></div>
            </div>
            <p>
               <label for="Tipo_Cargo">Tipo Cargo:</label>
                <%=Html.DropDownList("listaTipos") %>                    
               
            </p>
            
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Volver Atr�s", "Lista") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

