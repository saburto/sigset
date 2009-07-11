<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Especialidade>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Agregar Nueva Especialidad
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Agregar Nueva Especialidad</h2>

    <%= Html.ValidationSummary("No se ha agregado nueva especialidad. Favor corrija los siguientes errores.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Especialidad</legend>
           
            <p>
                <label for="Id_Tecnico">Rut Técnico:</label>
                <p><%= Html.Encode(Model.Id_Tecnico.GetRutCompleto()) %></p>
                <%= Html.Hidden("Id_Tecnico",Model.Id_Tecnico) %>
            </p>
            <p>
                <label for="Tipo_Especialidad">Tipo Especialidad:</label>
                <%= Html.DropDownList("tipoEspecialidades")%>
            </p>
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Volver", "AgregarEspecialidades") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

