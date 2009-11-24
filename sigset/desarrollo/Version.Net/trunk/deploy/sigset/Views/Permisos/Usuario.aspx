<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Permiso de Usuario
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Permiso de Usuario</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <fieldset>
        <legend>Datos Usuario</legend>
        <p><%=Html.Encode(Model.User) %></p>
        <p><%=Html.Encode(Model.Nombres) %></p>
        <p><%=Html.Encode(Model.ApellidoPaterno) %></p>
        <p><%=Html.Encode(Model.ApellidoMaterno) %></p>
    </fieldset>

    <% using (Html.BeginForm()) {%>
    <%= Html.Hidden("Id", Model.Id) %>
        <fieldset>
            <%foreach (var item in Model.UsuarioPermisos){%> 
                  
            <%}%>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

