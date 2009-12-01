<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Data.Modelo.Usuario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista
</asp:Content>

<asp:Content ContentPlaceHolderID="divContentStyle" runat="server">
    <%=Html.ImagenFondo("icons","Buddy%20Group.png") %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Lista de Usuarios</h2>
    <% if (TempData["MensajeError"] != null) %>
    <%{%>
     <h2 class ="field-validation-error" >
        <%=Html.Encode(TempData["MensajeError"])%>
     </h2>
    <%}%>

    <% Html.RenderPartial("ListaUsuario", Model); %>
    <%=Html.Paginador() %>

    <p>
        <%=Html.ButtonLinkIcon(Url.Action("Crear"),"Crear Nuevo",Iconos.circle_plus) %>
    </p>
</asp:Content>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

