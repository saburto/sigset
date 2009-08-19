<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Tecnico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear <%=Html.Encode("Técnico")%></h2>

    <%= Html.ValidationSummary("No se ha creado Técnico. Favor corrija los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Datos <%=Html.Encode("Técnico")%></legend>
            <p>
                <label for="Rut">Nombre Empleado:</label>
                <%=Html.DropDownList("listaEmpleadosTecnicos")%>
            </p>           
            <p>
                <label for="Nivel">Nivel:</label>
                  <%=Html.DropDownList("niveles")%>
            
            </p>
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Volver", "Lista") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

