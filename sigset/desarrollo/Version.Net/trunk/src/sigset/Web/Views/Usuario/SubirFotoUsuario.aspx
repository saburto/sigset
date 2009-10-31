<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SubirFotoUsuario</title>
    
    <link href="<%= Url.Content("~/Content/south-street/jquery-ui-1.7.2.custom.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/Site.css") %>" rel="stylesheet" type="text/css" />
    <%if (ViewData["error"] != null)
      { %>
    <script type="text/javascript">
        alert('<%=ViewData["error"]%>');
    </script>
    <%} %>
    
    <style type="text/css">
    .upload {
	position:relative;
	width:12px;
}
.realupload {
	position:absolute;
	top:0;
	right:0;

	/* start of transparency styles */
	opacity:0;
	-moz-opacity:0;
	filter:alpha(opacity:0);
	/* end of transparency styles */

	z-index:2; /* bring the real upload interactivity up front */
	width:12px;
}
    
    </style>
    
</head>
<body>
    <%using(Html.BeginForm("SubirFotoUsuario","Usuario",FormMethod.Post, new {enctype="multipart/form-data"})){ %>
    <div class="photo-container" style="width: 128px;">
        <div class="photo-content">
            <%if (Model != null){ %>
                <img width="128px" height="128px" src="<%=Url.Content("~/Content/usuarios/" + Model.ToString() + ".jpg")%>" />
            <%}else{ %>
                <img width="128px" height="128px" src="<%=Url.Content("~/Content/icons/Buddy.png")%>" />
            <%} %>
        </div>
        <div class="upload" style="cursor:pointer">
        	<a href="#" class="ui-icon ui-icon-folder-open" title="Subir Archivo" ></a>
		    <input type="file" name="upload" id="realupload" class="realupload" onchange="this.form.submit()" />
        </div>
    </div>
    <%} %>
</body>
</html>
