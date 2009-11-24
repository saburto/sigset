<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <%= Html.ValidationSummary() %>

    <% using (Html.BeginForm("Guardar", "PrecioGarantia", FormMethod.Post))
       {%>

        <fieldset>
         
            <p>
                <label for="ValorRevision">Valor Revisi&oacute;n:</label>
                <%= Html.Hidden("IdPrecioGarantia", null)%>
                <%=Html.TextBox("ValorRevision",null, new { @class = "required digits" })%>  
                <%= Html.ValidationMessage("ValorRevision", "*")%>
            </p>                
            <p> 
                <label for="ValorReparacion">Valor Reparaci&oacute;n:</label>
                <%=Html.TextBox("ValorReparacion",null, new { @class = "required digits" })%>  
                <%= Html.ValidationMessage("ValorReparacion", "*")%>
            </p>
        </fieldset>
       <p>
           <%=Html.ButtonSubmit("Guardar") %>
          
       </p>
    <% } %>
    <%=Html.ClientSideValidation("", typeof(Data.Modelo.PrecioGarantia)) %>
    
    


