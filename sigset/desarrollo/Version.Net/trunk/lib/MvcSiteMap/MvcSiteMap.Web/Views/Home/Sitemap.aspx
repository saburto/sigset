<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SiteMapNode>" %>


<asp:Content ID="siteMapHead" ContentPlaceHolderID="head" runat="server">
    <title><asp:Literal runat="server" Text="<%$ Resources:SiteMap %>" /></title>
</asp:Content>

<asp:Content ID="siteMapContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><asp:Literal runat="server" Text="<%$ Resources:SiteMap %>" /></h2>
    <%=Html.SiteMap(Model)%>
</asp:Content>
