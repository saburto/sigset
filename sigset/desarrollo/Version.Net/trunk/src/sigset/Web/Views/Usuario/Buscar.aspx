<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Buscar Usuarios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%= Html.ValidationSummary() %>
    <% using (Ajax.BeginForm("Buscar", new AjaxOptions { HttpMethod="POST", LoadingElementId="loadingAjax", UpdateTargetId="resultado" })){%>
        <fieldset>
            <legend>Buscar Usuarios</legend>
            <div class="three-column-container">
                <div class="three-column-left">
                    <p>
                        <label for="User">Nombre de Usuario:</label>
                        <%= Html.TextBox("User") %>
                        <%= Html.ValidationMessage("User", "*") %>
                    </p>
                 </div>
                 <div class="three-column-middle">
                   <p>
                        <label for="Rut">Rut:</label>
                        <%= Html.TextBox("Rut") %>
                        <%= Html.ValidationMessage("Rut", "*") %>
                    </p>
                  </div>
            </div>
            <div class="clear"></div>
            <div class="three-column-container">
                <div class="three-column-left">
                   <p>
                        <label for="Nombres">Nombres:</label>
                        <%= Html.TextBox("Nombres") %>
                        <%= Html.ValidationMessage("Nombres", "*") %>
                    </p>
                </div>
                <div class="three-column-middle">
                    <p>
                        <label for="ApellidoPaterno">Apellido Paterno:</label>
                        <%= Html.TextBox("ApellidoPaterno") %>
                        <%= Html.ValidationMessage("ApellidoPaterno", "*") %>
                    </p>
                </div>
                <div class="three-column-right">
                    <p>
                        <label for="PerfilUsuario">Perfil de Usuario:</label>
                        <%= Html.DropDownList("PerfilUsuario") %>
                        <%= Html.ValidationMessage("PerfilUsuario", "*") %>
                    </p>
                </div>
            </div>
            <div class="clear"></div>
            <br />
        </fieldset>
        <%=Html.ButtonSubmit("Buscar") %>
    <% } %>
    <br />
<div id="resultado"></div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

