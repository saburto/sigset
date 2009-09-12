<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title><asp:Literal runat="server" Text="<%$ Resources:Details %>" /></title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><asp:Literal runat="server" Text="<%$ Resources:Details %>" /></h2>

    <p>
        <asp:Literal runat="server" Text="<%$ Resources:LloremIpsum %>" />
    </p>
</asp:Content>
