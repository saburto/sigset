<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Tecnico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= Html.Encode("Detalles Técnico") %></h2>

    <fieldset>
        <p>
            Nombre:
            <%= Html.Encode(Model.Empleado.Nombre + " " + Model.Empleado.Apellido_Paterno + " " + Model.Empleado.Apellido_Materno) %>
        </p>
        <p>
            Rut:
            <%= Html.Encode(String.Format("{0}", Model.Rut.GetRutCompleto())) %>
        </p>
        <p>
            Nivel:
            <%= Html.Encode(String.Format("{0}", Model.Nivel)) %>
        </p>
         <p>
            <%= Html.Encode("Descripción:") %>
            <%= Html.Encode(Model.Nivel1.Descripcion) %>
        </p>
        
  </fieldset>  
  <fieldset>
  <legend>Especialidades</legend>
  <table border="0" cellpadding="0" cellspacing="0" class="data-table">
  <tr>
             <th>
                Id
            </th>
            <th>
                <%=Html.Encode("Descripción")%>
            </th>
    </tr>
        
    <%bool alter = false; %>
    <% foreach (var item in Model.Especialidades)
           { %>
    <%if (alter)
      { %>
        <tr class="row-alternating">
    <%}
      else
      { %>
      
        <tr>
    <%} %>
             <td>
               <%= Html.Encode(item.Tipo_Especialidad1.Id_Tipo_Especialidad) %>
              </td>
              <td>
               <%= Html.Encode(item.Tipo_Especialidad1.Descripcion) %>
              </td>      
    </tr>
    
     <%} %>
     </table>
           
    </fieldset>
    <p>
      <%=Html.ActionLink("Volver", "Lista") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

