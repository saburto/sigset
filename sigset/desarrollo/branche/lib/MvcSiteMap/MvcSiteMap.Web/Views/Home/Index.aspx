<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexHead" ContentPlaceHolderID="head" runat="server">
    <title><asp:Literal runat="server" Text="<%$ Resources:Home %>" /></title>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
        <asp:Literal runat="server" Text="<%$ Resources:HomeText %>" />
    </p>
</asp:Content>
