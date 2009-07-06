<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Tecnico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear <%=Html.Encode("Técnico")%></h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Datos <%=Html.Encode("Técnico")%></legend>
            <p>
                <label for="Rut">Rut:</label>
                <%=Html.DropDownList("listaEmpleadosTecnicos")%>
            </p>
             <p>
                <label for="Rut">Especialidad:</label>
                <%=Html.DropDownList("tipoEspecialidad")%>
            </p>
            <p>
                <label for="Nivel">Nivel:</label>
                  <%=Html.DropDownList("niveles")%>
            
            </p>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

