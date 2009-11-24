<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Permiso>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Id">Id:</label>
                <%= Html.TextBox("Id", Model.Id) %>
                <%= Html.ValidationMessage("Id", "*") %>
            </p>
            <p>
                <label for="Mod_Id">Mod_Id:</label>
                <%= Html.TextBox("Mod_Id", Model.Mod_Id) %>
                <%= Html.ValidationMessage("Mod_Id", "*") %>
            </p>
            <p>
                <label for="Opcion">Opcion:</label>
                <%= Html.TextBox("Opcion", Model.Opcion) %>
                <%= Html.ValidationMessage("Opcion", "*") %>
            </p>
            <p>
                <label for="DescripcionOpcion">DescripcionOpcion:</label>
                <%= Html.TextBox("DescripcionOpcion", Model.DescripcionOpcion) %>
                <%= Html.ValidationMessage("DescripcionOpcion", "*") %>
            </p>
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

