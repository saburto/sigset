<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Empleado>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar</h2>

    <%= Html.ValidationSummary("No se ha realizado edición. Favor corrija los siguientes datos.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Editar Empleado</legend>
             <div class="three-column-container">
            <div class="three-column-left">
            <p>
                <label for="Rut">Rut:</label>
                <%= Html.RutTextBox(Model.Rut,true)%>
                <%= Html.ValidationMessage("Rut", "*") %>
             
            </p>
            <p>
                <label for="ApellidoPaterno">Apellido Paterno:</label>
                <%= Html.TextBox("ApellidoPaterno", Model.ApellidoPaterno) %>
                <%= Html.ValidationMessage("Apellido Paterno", "*") %>            
            </p>
              </div>
            <div class="three-column-middle">
            <p>
                <label for="Nombre">Nombre:</label>
                <%= Html.TextBox("Nombre", Model.Nombre) %>
                <%= Html.ValidationMessage("Nombre", "*") %>
            </p>
            <p>
                <label for="Apellido Materno">Apellido Materno:</label>
                <%= Html.TextBox("ApellidoMaterno", Model.ApellidoMaterno) %>
                <%= Html.ValidationMessage("Apellido Materno", "*") %>
            </p>
             </div>
            <div class="clear"></div>
            </div>
            <p>
               <label for="listaTipos">Tipo Cargo:</label>
               <%=Html.DropDownList("listaTipos")%>
               <%= Html.ValidationMessage("Tipo Cargo", "*")%>

               
              
            </p>
               
            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    <div>
    <p>
        <%=Html.ActionLink("Volver Atrás", "Lista") %>
    </p>        
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

