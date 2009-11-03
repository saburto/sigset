<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar Usuario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.ValidationSummary("No se ha modificado usuario. Favor corrija los siguientes errores.") %>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Editar Usuario</legend>
        <p>
            <label for="Activo" style="display: inline !important">
                Estado Activo:</label>
            <%=Html.CheckBox("Activo", Model.Activo, new { title="Define si el usuario esta activo o desactivado" })%>
        </p>
        <div class="clear">
        </div>
        <div class="three-column-container">
            <div class="three-column-left">
                <p>
                    <label for="User">
                        Nombre Usuario:</label>
                    <%= Html.TextBox("User", Model.User, new { title="Nombre usuario que permitirá logearse en el sistema"})%>
                    <%= Html.ValidationMessage("User", "*") %>
                </p>
            </div>
            <div class="three-column-middle">
                <p>
                    <label for="Pass">
                        Contrase&ntilde;a
                    </label>
                    <%= Html.Password("Password", Model.Password, new { title="Contraseña de usuario" })%>
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
        <legend>Editar Datos Personales</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 100%">
                    <div style="width: 90%">
                            <div class="two-column-left">
                                <p>
                                    <label for="Rut">
                                        Rut:</label>
                                    <%=Html.Hidden("Rut",Model.Rut) %>
                                    <%=Html.Encode(Model.Rut.GetRutCompleto()) %>
                                </p>
                            </div>
                            <div class="two-column-right">
                                <p>
                                    <label for="Nombre">
                                        Nombres:</label>
                                    <%= Html.TextBox("Nombres", Model.Nombres, new {title="Nombre o nombres del usuario" })%>
                                    <%= Html.ValidationMessage("Nombres", "*") %>
                                </p>
                            </div>
							<div class="clear"></div>
							<div class="two-column-left">
                                <p>
                                    <label for="ApellidoPaterno">
                                        Apellido Paterno:</label>
                                    <%= Html.TextBox("ApellidoPaterno", Model.ApellidoPaterno, new { title="Apellido Paterno del Usuario" })%>
                                    <%= Html.ValidationMessage("ApellidoPaterno", "*") %>
                                </p>
                            </div>
                            <div class="two-column-right">
                                <p>
                                    <label for="ApellidoMaterno">
                                        Apellido Materno:</label>
                                    <%= Html.TextBox("ApellidoMaterno", Model.ApellidoMaterno, new { title = "Apellido Materno del Usuario" })%>
                                    <%= Html.ValidationMessage("ApellidoMaterno", "*") %>
                                </p>
                            </div>
							<div class="clear"></div>
                            <div class="two-column-left">
                                <p>
                                    <label for="Email">
                                        Email:</label>
                                    <%= Html.TextBox("Email", Model.Email, new { title = "Email del usuario, ej: email@email.com" })%>
                                    <%= Html.ValidationMessage("Email", "*") %>
                                </p>
                            </div>
                            <div class="two-column-right">
                                <p>
                                    <label for="Telefono">
                                        Telefono:</label>
                                    <%= Html.TextBox("Telefono", Model.Telefono, new { title = "Telefono del Usuario, formato solo numeros ej:02328123" })%>
                                    <%= Html.ValidationMessage("Telefono", "*")%>
                                </p>
                            </div>
							<div class="clear"></div>
                    </div>
                </td>
                <td valign="top">
                    <%if (ViewData["imagen"] != null)
                      { %>
                    <iframe scrolling="no" frameborder="0" width="200" height="200" src="<%=Url.Action("SubirFotoUsuario", new {id=Model.Id })%>">
                    </iframe>
                    <%}
                      else
                      { %>
                    <iframe scrolling="no" frameborder="0" width="200" height="200" src="<%=Url.Action("SubirFotoUsuario")%>">
                    </iframe>
                    <%} %>
                </td>
            </tr>
        </table>
    </fieldset>
    <p style="float: left">
        <%=Html.ButtonLinkIcon(Url.Action("Lista"), "Volver", Iconos.arrow_1_w, IconPosition.left, new {title="Volver a lista de usuarios" })%>
    </p>
    <p style="float: right">
        <%=Html.ButtonSubmit("Guardar") %>
    </p>
    <% } %>
    <%=Html.ClientSideValidation("",typeof(Data.Modelo.Usuario)) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>
