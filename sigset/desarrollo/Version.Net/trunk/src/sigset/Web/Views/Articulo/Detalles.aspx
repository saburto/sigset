<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Articulo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles</h2>

    <fieldset>
        <legend>Fields</legend>
        <p>
            Id:
            <%= Html.Encode(String.Format("{0:F}", Model.Id)) %>
        </p>
        <p>
            Modelo:
            <%= Html.Encode(Model.Modelo) %>
        </p>
        <p>
            Marca:
            <%= Html.Encode(String.Format("{0:F}", Model.Marca)) %>
        </p>
        <p>
            <%=Html.Encode("Tipo Art�culo")%>:
            <%= Html.Encode(String.Format("{0:F}", Model.TipoArticulo)) %>
        </p>
        <p>
            <%=Html.Encode("Categor�a")%>:
            <%= Html.Encode(String.Format("{0:F}", Model.Categoria)) %>
        </p>
        <p>
            PrecioGarantia:
            <%= Html.Encode(String.Format("{0:F}", Model.PrecioGarantia)) %>
        </p>
        <p>
            <%=Html.Encode("L�nea")%>:
            <%= Html.Encode(String.Format("{0:F}", Model.Linea)) %>
        </p>
    </fieldset>
    <p>

        <%=Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

