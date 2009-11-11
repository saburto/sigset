<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Data.Modelo.Tecnico>>" %>

  <div id="tecnicos" title="Tecnicos">
        
        <%foreach(var tecnico in Model){ %>
        
            <div class="tecnico">
                <table class="ui-widget ui-widget-content ui-corner-all" style="border: 3px solid #459E00; height:80px;width:100%;overflow:hidden; background-color:#FFFFFF !important;">
                    <tr>
                        <td colspan="2" >
                        <span class="nombre ui-widget-header ui-corner-all ui-helper-clearfix" style="text-align:center; font-size:1.2em; color:#459E00;font-weight:bold;font-family:'trebuchet MS',verdana,sans-serif;">
                            <%=Html.Encode(tecnico.Usuario.NombreCompleto) %>
                        </span>
                        <input type="hidden" value="<%=tecnico.Id %>" name="idTecnico" />
                        </td>
                    </tr>
                    <tr>
                        <td  style="padding: 2px;">
                            <%=Html.ImagenUsuario(tecnico.Id, "imagenUsuario", "Usuario", null) %>
                        </td>
                        <td 
                            style="padding: 2px; vertical-align: top; text-align: left; color: #000000">
                            Ordenes:<br />
                            En revision: <%=tecnico.OrdenesEnRevision() %><br />
                            Revisadas: <%=tecnico.OrdenesReparadas() %><br />
                            
                            <div class="starsDiv">
                                <select>
	    			                <%=Html.NivelesTecnicos((int)tecnico.Nivel) %>
        			            </select>
                            </div>
                            
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <%} %>
            
        </div>