<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Data.Modelo.Direccion>" %>
<%if(Model != null){ %>
        <p>
            Id:
            <%= Html.Encode(String.Format("{0:F}", Model.Id)) %>
        </p>
        <p>
            Region:
            <%= Html.Encode(String.Format("{0:F}", Model.Region)) %>
        </p>
        <p>
            Ciudad:
            <%= Html.Encode(Model.Ciudad) %>
        </p>
        <p>
            Comuna:
            <%= Html.Encode(Model.Comuna) %>
        </p>
        <p>
            Calle:
            <%= Html.Encode(Model.Calle) %>
        </p>
        <p>
            Numero:
            <%= Html.Encode(String.Format("{0:F}", Model.Numero)) %>
        </p>
        <p>
            Codigo Postal:
            <%= Html.Encode(Model.Codigo_Postal) %>
        </p>
    <p>

        <%=Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>
<%} %>

