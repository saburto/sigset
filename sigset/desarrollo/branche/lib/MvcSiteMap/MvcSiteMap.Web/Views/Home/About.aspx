<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutHead" ContentPlaceHolderID="head" runat="server">
    <title><asp:Literal runat="server" Text="<%$ Resources:About %>" /></title>
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><asp:Literal runat="server" Text="<%$ Resources:About %>" /></h2>
    <p>
        <asp:Literal runat="server" Text="<%$ Resources:AboutText %>" />
    </p>
</asp:Content>
