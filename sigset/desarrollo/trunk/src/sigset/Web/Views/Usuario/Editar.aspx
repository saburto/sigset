<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar</h2>

    <%= Html.ValidationSummary("No se ha modificado usuario. Favor corrija los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Editar Usuario</legend>
            <p>
                <%=ViewData["listaNombreEmpleado"]%>                  
            </p>
            <p>
             <%=ViewData["listaRut"]%>    
            </p>
             <div class="three-column-container">
            <div class="three-column-left">
            <p>
                <label for="Usuario1">Nombre Usuario:</label>
                <%= Html.TextBox("Usuario1", Model.Usuario1) %>
                <%= Html.ValidationMessage("Usuario1", "*") %>
            </p>
               <p>
                <label for="Tipo_Usuario">Tipo Usuario:</label>
                <%= Html.DropDownList("listaTipos") %>
            </p>
              <p>
                <input type="submit" value="Guardar" />
            </p>
             </div>
            <div class="three-column-middle">
            <p>
                <label for="Pass">Contrase&ntilde;a:</label>
                <%= Html.Password("Pass", Model.Contraseña) %>
                <%= Html.ValidationMessage("Pass", "*") %>
            </p>                  
          
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Volver", "Lista")%>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

