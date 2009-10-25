<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Empleado>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles Empleado</h2>

   
        <p>
            Rut:
            <%= Html.Encode(String.Format("{0}", Model.Rut.GetRutCompleto())) %>
        </p>
        <p>
            Nombre:
            <%= Html.Encode(Model.Nombre) %>
        </p>
        <p>
            Apellido Paterno:
            <%= Html.Encode(Model.ApellidoPaterno) %>
        </p>
        <p>
            Apellido Materno:
            <%= Html.Encode(Model.ApellidoMaterno) %>
        </p>
        <p>
            Tipo Cargo:
            <%= Html.Encode(String.Format("{0}", Model.Tipo_Cargo1.Descripcion)) %>
        </p>
  
    <p>

        <%=Html.ActionLink("Editar", "Editar", new { id=Model.Rut }) %> |
        <%=Html.ActionLink("Volver Atrás", "Lista") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

