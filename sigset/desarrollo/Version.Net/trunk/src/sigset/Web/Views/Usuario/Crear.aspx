<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Crear Usuario
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="validationSummary">
        <%= Html.ValidationSummary("No se puede crear usuario. Favor corrija los siguientes errores.") %>
    </div>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Nuevo Usuario</legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <p>
                    <label for="User">
                        Nombre Usuario:</label>
                    <%= Html.TextBox("User", null, new { title="Nombre usuario que permitirá logearse en el sistema"})%>
                    <%= Html.ValidationMessage("User", "*") %>
                </p>
            </div>
            <div class="three-column-middle">
                <p>
                    <label for="Pass">
                        Contrase&ntilde;a
                    </label>
                    <%= Html.Password("Password", null, new { title="Contraseña de usuario" })%>
                    <%= Html.ValidationMessage("Password", "*")%>
                </p>
            </div>
            <div class="three-column-right">
                <p>
                    <label for="Perfil">
                        Perfil:</label>
                    <%= Html.DropDownList("PerfilUsuario", null, new { title="Perfil de usuario, define permisos" })%>
                </p>
            </div>
            <div class="clear">
            </div>
        </div>
    </fieldset>
    <fieldset <%=Html.ImagenFondo("icons","Buddy.png") %>>
        <legend>Datos Personales</legend>
        <div class="three-column-container">
                <div class="three-column-left">
                    <p>
                        <label for="Rut">
                            Rut:</label>
                        <%= Html.RutTextBox()%>
                        <%= Html.ValidationMessage("Rut", "*") %>
                    </p>
                </div>
                <div class="three-column-middle">
                    <p>
                        <label for="Nombre">
                            Nombres:</label>
                        <%= Html.TextBox("Nombres", null, new {title="Nombre o nombres del usuario" })%>
                        <%= Html.ValidationMessage("Nombres", "*") %>
                    </p>
                </div>
        </div>
        <div class="clear"></div>
        <div class="three-column-container">
                <div class="three-column-left">
                    <p>
                        <label for="ApellidoPaterno">
                            Apellido Paterno:</label>
                        <%= Html.TextBox("ApellidoPaterno", null, new { title="Apellido Paterno del Usuario" })%>
                        <%= Html.ValidationMessage("ApellidoPaterno", "*") %>
                    </p>
                </div>
                <div class="three-column-middle">
                    <p>
                        <label for="ApellidoMaterno">
                            Apellido Materno:</label>
                        <%= Html.TextBox("ApellidoMaterno", null, new { title = "Apellido Materno del Usuario" })%>
                        <%= Html.ValidationMessage("ApellidoMaterno", "*") %>
                    </p>
                </div>
        </div>
        <div class="clear"></div>
                <div class="three-column-container">
                <div class="three-column-left">
                    <p>
                        <label for="Email">
                            Email:</label>
                        <%= Html.TextBox("Email", null, new { title = "Email del usuario, ej: email@email.com" })%>
                        <%= Html.ValidationMessage("Email", "*") %>
                    </p>
                </div>
                <div class="three-column-middle">
                    <p>
                        <label for="Telefono">
                            Telefono:</label>
                        <%= Html.TextBox("Telefono", null, new { title = "Telefono del Usuario, formato solo numeros ej:02328123" })%>
                        <%= Html.ValidationMessage("Telefono", "*")%>
                    </p>
                </div>
        </div>
        <div class="clear"></div>
    </fieldset>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("Lista"), "Volver", Iconos.arrow_1_w, IconPosition.left, new {title="Volver a lista de usuarios" })%>
    </p>
    <p style="float: right">
        <%=Html.ButtonSubmit("Crear") %>
    </p>
    <% } %>
    
    <%=Html.ClientSideValidation("",typeof(Data.Modelo.Usuario)) %>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
