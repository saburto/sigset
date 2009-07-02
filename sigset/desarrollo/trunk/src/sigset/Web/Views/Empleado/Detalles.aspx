<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Empleado>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles</h2>

 
    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Datos Empleado</legend>
              <div class="three-column-container">
            <div class="three-column-left">
            <p>
                <label for="Rut">Rut:</label>
                <%= Html.RutTextBox(Model.Rut,true) %>
                
            </p>
            <p>
                <label for="Apellido_Paterno">Apellido Paterno:</label>
                <%= Html.TextBox("Apellido_Paterno", Model.Apellido_Paterno) %>
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
             <label for="Apellido_Materno">Apellido Materno:</label>
                <%= Html.TextBox("Apellido_Materno", Model.Apellido_Materno) %>
                <%= Html.ValidationMessage("Apellido Materno", "*") %>
                         
            </p>
             </div>
            <div class="clear"></div>
            </div>
             <p>
               <label for="Tipo_Cargo">Tipo Cargo:</label>
               <%=Html.DropDownList("listaTipos", Model.Tipo_Cargo.Descripcion)%>
              
            </p>
      </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Volver Atrás", "Lista") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

