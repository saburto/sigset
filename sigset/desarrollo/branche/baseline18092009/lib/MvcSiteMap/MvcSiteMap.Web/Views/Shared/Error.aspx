<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorHead" ContentPlaceHolderID="head" runat="server">
    <title><asp:Literal runat="server" Text="<%$ Resources:Error %>" /></title>
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Literal runat="server" Text="<%$ Resources:ErrorMessage %>" />
    </h2>
</asp:Content>
