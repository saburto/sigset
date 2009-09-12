<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title><asp:Literal runat="server" Text="<%$ Resources:ProductsList %>" /></title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><asp:Literal runat="server" Text="<%$ Resources:ProductsList %>" /></h2>

    <p>
        <asp:Literal runat="server" Text="<%$ Resources:Product %>" /> <%=Html.Encode(ViewData["category"])%>:
        <%=Html.ActionLink(ViewData["product"].ToString(), "Details", new { id = ViewData["product"] })%>
    </p>
</asp:Content>
