<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Consulta Orden de Trabajo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Consulta</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Ajax.BeginForm("Consulta", new AjaxOptions { HttpMethod="POST", LoadingElementId="loadingAjax", UpdateTargetId="resultado" }))
       {%>

        <fieldset>
            <legend>Consulta Orden de Trabajo</legend>
            <p>
                <label for="Id"><%=Html.Encode("Número de Orden de Trabajo")%></label>
                <%= Html.TextBox("Id")%>
                <%= Html.ValidationMessage("Id", "*")%>
            </p>
            <p>
                <label for="Rut">Rut Cliente:</label>
                <%= Html.RutTextBox()%>
                <%= Html.ValidationMessage("Rut", "*")%>
            </p>
            <p>
                <input type="submit" value="Consultar" />
            </p>
        </fieldset>

    <% } %>
    <div id="resultado"></div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

