<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Html.Encode("�rea T�cnica") %> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Html.Encode("�rea T�cnica") %> </h2>
    
    
    <%if (ViewData["MensajeAreaTecnica"] != null && !string.IsNullOrEmpty(ViewData["MensajeAreaTecnica"].ToString()))
      {%>
      
      <p>
        <% =Html.Encode(ViewData["MensajeAreaTecnica"].ToString())%>
      
      </p>
          
      <%} %>
    
        
    

</asp:Content>

