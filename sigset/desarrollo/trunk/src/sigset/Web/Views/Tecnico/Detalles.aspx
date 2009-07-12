<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Tecnico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= Html.Encode("Detalles Técnico") %></h2>

    <fieldset>
        <p>
            Rut:
            <%= Html.Encode(String.Format("{0}", Model.Rut.GetRutCompleto())) %>
        </p>
        <p>
            Nivel:
            <%= Html.Encode(String.Format("{0}", Model.Nivel)) %>
        </p>
    </fieldset>
    <p>

        <%=Html.ActionLink("Edit", "Edit", new { id=Model.Rut }) %> |
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

