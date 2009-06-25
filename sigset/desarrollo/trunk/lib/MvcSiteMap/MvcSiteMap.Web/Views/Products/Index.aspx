<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title><asp:Literal runat="server" Text="<%$ Resources:Products %>" /></title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><asp:Literal runat="server" Text="<%$ Resources:Products %>" /></h2>

    <ul>
        <li><%=Html.ActionLink("Books", "List", new { id = "Books" })%></li>
        <li><%=Html.ActionLink("DVD", "List", new { id = "DVD" })%></li>
        <li><%=Html.ActionLink("Electronics", "List", new { id = "Electronics" })%></li>
    </ul>
</asp:Content>
