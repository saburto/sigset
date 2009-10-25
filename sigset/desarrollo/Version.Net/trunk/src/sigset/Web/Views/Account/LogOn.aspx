<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Log On
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2> Inicio de Sesi&#243;n</h2>
    <p>
        Ingrese nombre de usuario y contraseña
    </p>
    <%= Html.ValidationSummary("Usuario y/o contraseña no valido. Intente Nuevamente") %>

    <% using (Html.BeginForm()) { %>
        <div>
            <fieldset>
                <p>
                    <label for="username">Nombre de Usuario:</label>
                    <%= Html.TextBox("User")%>
                    <%= Html.ValidationMessage("User","*") %>
                </p>
                <p>
                    <label for="password">Contraseña:</label>
                    <%= Html.Password("Password")%>
                    <%= Html.ValidationMessage("Password", "*") %>
                </p>
                <p>
                    <%= Html.CheckBox("rememberMe") %> <label class="inline" for="rememberMe">Recordar Sesi&#243;n</label>
                </p>
                <p>
                    <input type="submit" value="Iniciar Sesi&#243;n" />
                </p>
            </fieldset>
        </div>
    <% } %>
    <%=Html.ClientSideValidation("",typeof(Data.Modelo.Usuario))%>
</asp:Content>
