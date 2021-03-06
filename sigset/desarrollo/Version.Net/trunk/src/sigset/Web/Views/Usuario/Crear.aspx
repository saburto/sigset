<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Crear Usuario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.ValidationSummary("No se puede crear usuario. Favor corrija los siguientes errores.") %>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Nuevo Usuario</legend>
        <div class="three-column-container">
            <div class="three-column-left">
                <p>
                    <label for="User">
                        Nombre Usuario:</label>
                    <%= Html.TextBox("User", null, new { title="Nombre usuario que permitir� logearse en el sistema"})%>
                    <%= Html.ValidationMessage("User", "*") %>
                </p>
            </div>
            <div class="three-column-middle">
                <p>
                    <label for="Pass">
                        Contrase&ntilde;a
                    </label>
                    <%= Html.Password("Password", null, new { title="Contrase�a de usuario" })%>
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
    <fieldset>
        <legend>Datos Personales</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 100%">
                    <div style="width: 90%">
                        <div class="two-column-left">
                            <p>
                                <label for="Rut">
                                    Rut:</label>
                                <%= Html.RutTextBox()%>
                                <%= Html.ValidationMessage("Rut", "*") %>
                            </p>
                        </div>
                        <div class="two-column-right">
                            <p>
                                <label for="Nombre">
                                    Nombres:</label>
                                <%= Html.TextBox("Nombres", null, new {title="Nombre o nombres del usuario" })%>
                                <%= Html.ValidationMessage("Nombres", "*") %>
                            </p>
                        </div>
                        <div class="clear"></div>
                        <div class="two-column-left">
                            <p>
                                <label for="ApellidoPaterno">
                                    Apellido Paterno:</label>
                                <%= Html.TextBox("ApellidoPaterno", null, new { title="Apellido Paterno del Usuario" })%>
                                <%= Html.ValidationMessage("ApellidoPaterno", "*") %>
                            </p>
                        </div>
                        <div class="two-column-right">
                            <p>
                                <label for="ApellidoMaterno">
                                    Apellido Materno:</label>
                                <%= Html.TextBox("ApellidoMaterno", null, new { title = "Apellido Materno del Usuario" })%>
                                <%= Html.ValidationMessage("ApellidoMaterno", "*") %>
                            </p>
                        </div>
                    <div class="clear">
                    </div>
                    <div class="two-column-left">
                        <p>
                            <label for="Email">
                                Email:</label>
                            <%= Html.TextBox("Email", null, new { title = "Email del usuario, ej: email@email.com" })%>
                            <%= Html.ValidationMessage("Email", "*") %>
                        </p>
                    </div>
                    <div class="two-column-right">
                        <p>
                            <label for="Telefono">
                                <%=Html.Encode("Tel�fono:") %></label>
                            <%= Html.TextBox("Telefono", null, new { title = "Tel�fono del Usuario, formato solo numeros ej:02328123" })%>
                            <%= Html.ValidationMessage("Telefono", "*")%>
                        </p>
                    </div>
                    <div class="clear">
                    </div>
                    </div>
                </td>
                <td valign="top">
                    <iframe scrolling="no" frameborder="0" width="200" height="200" src="<%=Url.Action("SubirFotoUsuario") %>">
                    </iframe>
                </td>
            </tr>
        </table>
    </fieldset>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("Lista"), "Volver", Iconos.arrow_1_w, IconPosition.left, new {title="Volver a lista de usuarios" })%>
    </p>
    <p style="float: right">
        <%=Html.ButtonSubmit("Crear") %>
    </p>
    <% } %>
    <%=Html.ClientSideValidation("",typeof(Data.Modelo.Usuario))
        .AddRule("User", new xVal.Rules.RemoteRule(Url.Action("UsuarioExiste")))
        .AddRule("Rut", new xVal.Rules.RemoteRule(Url.Action("RutExiste")))
            
            %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
