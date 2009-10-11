<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>	
<%@page import="java.util.*"%>

<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="cl.sigti.sigset.modelo.Usuario"%>

<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.jsf.WebApplicationContextVariableResolver"%>
<%@page import="org.springframework.web.servlet.mvc.Controller"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="shortcut icon" href="<c:url value="/content/images/favicon.ico" />" />
	<link href="<c:url value="/content/south-street/jquery-ui-1.7.2.custom.css" />"	rel="stylesheet" type="text/css" />
	<link href="<c:url value="/content/Site.css" />" rel="stylesheet" type="text/css" media="interactive, braille, emboss, handheld, projection, screen, tty, tv" />
	<link href="<c:url value="/content/print-styles.css" />" rel="stylesheet" type="text/css" media="print" />
	<link href="<c:url value="/content/jquery.tooltip.css" />" rel="stylesheet" type="text/css" />
	<title>Sigset</title>
	
	<script src="<c:url value="/scripts/jquery-1.3.2.min.js" />"></script>
	<script src="<c:url value="/scripts/jquery-ui-1.7.2.custom.min.js" />"></script>
	<script src="<c:url value="/scripts/jquery.tooltip.min.js" />"></script>
	<script src="<c:url value="/scripts/jquery.validate.min.js" />"></script>
	<script src="<c:url value="/scripts/localization/messages_es.js" />"></script>
	<script src="<c:url value="/scripts/jquery.history.js" />"></script>
	<script src="<c:url value="/scripts/additional-methods.js" />"></script>
	<script src="<c:url value="/scripts/jquery.scrollTo-1.4.2-min.js" />"></script>
	<script src="<c:url value="/scripts/jquery.autocomplete.js" />"></script>
	<script src="<c:url value="/scripts/sigset.js" />"></script>
	
	<!--<script src="http://www.google.com/jsapi"></script>
	<script type="text/javascript">
		google.load("jquery", "1.3.2");
		google.load("jqueryui", "1.7.2");
	</script>
	-->
	<script type="text/javascript">

		jQuery.fn.center = function () {
		    this.css("position","absolute");
		    this.css("top", ( $(window).height() - this.height() ) / 2+$(window).scrollTop() + "px");
		    this.css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft() + "px");
		    return this;
		};

	
		jQuery.ajaxSetup({
			beforeSend: function(XMLHttpRequest) {
				$("#content").fadeTo(100,0.33,function(){
					if(jQuery.browser.msie){
					 this.style.removeAttribute('filter');
					}
				});
				$("#loadingAjax").center();
				$("#loadingAjax").show();
			},
			complete: function(XMLHttpRequest, textStatus) {
				$("#loadingAjax").hide();    
				$("#content").fadeTo(100,1,function(){
					if(jQuery.browser.msie){
						 this.style.removeAttribute('filter');
					}
				});
			}
		});

		function pageload(hash) {
			// hash doesn't contain the first # character.
			if(hash) {
				// restore ajax loaded state
				
		      	var r = /^\/\w*\/$/;
      			var t = r.test(hash);
				abrirContenido(hash, t);
			} else {
				// start page
				$("#content").html("");
				$("#MenuIzquierda").html("");
			}
		}
		
		$(document).ready(function() {
			$("#tabs").tabs();

			// Initialize history plugin.
			// The callback is called at once by present location.hash. 
			$.history.init(pageload);
			
			// set onlick event for buttons
			$("a[rel='history']").click(function(){

				
				
				var hash = this.href;
				hash = hash.replace(/^.*#/, '');
				// moves to a new page. 
				// pageload is called at once. 
				$.history.load(hash);
				return false;
			});
		});

		var InitForm;
		
		function abrirContenido(url, menu){
			$("#content").html("");

			if(menu){
				$("#MenuIzquierda").html("<p>Cargando Menu...</p>");
				$("#MenuIzquierda").load(url + "menu/");
			}
			
			$("#content").load(url,function(){
					
				$("#tabs").tabs();
				
				if(InitForm != undefined){
					InitForm();
				}
				
				$("#loadingAjax").hide(); 
				$("#content").fadeTo(100,1,function(){
					if(jQuery.browser.msie){
						 this.style.removeAttribute('filter');
					}
				});				
			});
		}
		
	</script>
</head>
<body>
<div id="loadingAjax" style="display:none;width:10%;height:5%">Cargando... 
		<img src="<c:url value="/content/images/ajax-loader.gif" />" alt="Cargando.." />
</div>


	<div class="none"><a href="#maincontent"></a></div>
	<div class="header-container">
		<div class="nav-login">
			<ul>
				<%if(SecurityContextHolder.getContext().getAuthentication().isAuthenticated() && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Usuario){%>
					<li><%=((Usuario)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getNombresApellido() %><a href='<s:url value="/logout/" />'>[Cerrar Sesi&oacute;n]</a></li>
				<%}else{ %>
					<li><a href="<s:url value="/login/" />">Iniciar Sesi&oacute;n</a></li>
				<%}%>
			</ul>
		</div>
		<div class="logo"><!-- Link pagina de inicio -->
			<a href="<s:url value="/" />">SERVICIO T&#201;CNICO</a>
		</div>
		<div class="clear"></div>
	</div>
	<div class="poster-container-no-image">
		<div class="poster-inner"></div>
	</div>
	<div class="nav-main" >
		<ul>
			<li><a href="/">Inicio</a></li>
			<li><a  rel="history"  href="#/orden/">Orden de Trabajo</a></li>
			<li><a  rel="history"  href="#/admin/">Administraci&oacute;n</a></li>
			<li><a  rel="history"  href="#/tecnica/">&Aacute;rea T&eacute;cnica</a></li>
			<li><a  rel="history"  href="#/config/">Configuraci&oacute;n Sistema</a></li>
			<li><a  rel="history"  href="#/informes/">Informes</a></li>
			<li><a  rel="history"  href="#/sistema/">Sistema</a></li>
			

		</ul>
	</div>
	<div class="content-container">
		<div class="content-container-inner">
			<div class="content-main">
				<div id="content">
					<h2>P&aacute;gina de Inicio</h2>
				</div>
<%--
<h1 class="first">&lt;H1&gt; Header</h1>
<div class="photo-container align-left" style="width: 202px;">
<div class="photo-content"><img src="" alt="Photo Small 1" /></div>
<div class="photo-caption">Photo caption goes here</div>
</div>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat
volutpat. Ut wisi enim ad minim veniam, quis nostrud exercitation ulliam
corper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis
autem veleum iriure dolor in hendrerit in vulputate velit esse molestie
consequat, vel willum lunombro dolore eu feugiat nulla facilisis at vero
eros et accumsan et iusto odio dignissim qui blandit praesent luptatum
zzril delenit augue duis dolore te <a href="#">link nulla facilisi</a>.
</p>
<h2>&lt;H2&gt; Header</h2>
<p>Li Europan lingues es membres del sam familie. Lor separat
existentie es un myth. Por scientie, musica, sport etc., li tot Europa
usa li sam vocabularium. Li lingues differe solmen in li grammatica, li
pronunciation e li plu commun vocabules. Omnicos directe al desirabilit
de un nov lingua franca: on refusa continuar payar custosi traductores.
It solmen va esser necessi far uniform grammatica, pronunciation e plu
sommun paroles.</p>
<ul>
	<li>Quisque tristique augue ac pede.</li>
	<li>Praesent arcu ante, tincidunt a, ullamcorper at, vehicula vel,
	risus.</li>
	<li>Vivamus consequat tortor in neque.</li>
	<li>Morbi sit amet arcu. Nam nonummy dui eu arcu.</li>
</ul>
<div class="photo-container align-right" style="width: 202px;">
<div class="photo-content"><img src="" alt="Photo Small 2" /></div>
<div class="photo-caption">Photo caption goes here</div>
</div>
<p>Ma quande lingues coalesce, li grammatica del resultant lingue es
plu simplic e regulari quam ti del coalescent lingues. Li nov lingua
franca va esser plu simplic e regulari quam li existent Europan lingues.
It va esser tam simplic quam Occidental: in fact, it va esser
Occidental. A un Angleso it va semblar un simplificat Angles, quam un
skeptic Cambridge amico dit me que Occidental es.</p>
<p>Maecenas scelerisque, orci vel lobortis pharetra, mauris tortor
tempor ligula, a fringilla lectus elit at arcu. Morbi vel felis.
Pellentesque mattis ipsum ut risus. Cras fringilla laoreet diam. Cras eu
enim et risus porttitor tristique. Vestibulum ac lacus in erat laoreet
rutrum. Sed mi arcu, auctor ut, mattis vel, molestie at, tortor. Donec
faucibus, erat id ullamcorper iaculis, lorem magna lacinia dolor, vel
feugiat arcu lectus ut justo. Duis felis dui, varius id, consequat ac,
tincidunt eu, ligula. Integer eu mi. Aenean laoreet, nisi eu varius
hendrerit, libero magna tempor nulla, quis hendrerit est turpis non
nunc. Morbi luctus mi et lorem. Aenean interdum, elit eget dignissim
sodales, diam mi imperdiet risus, id porta sapien elit nec arcu. In
neque arcu, aliquam at, tempor ut, scelerisque eu, sem. Aliquam vel
metus. Cras augue. Donec leo orci, bibendum in, posuere at, dapibus
eget, diam. Pellentesque quis odio at felis ullamcorper dignissim. Nam
nunc. Cras hendrerit scelerisque diam.</p>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	class="data-table">
	<caption>&lt;caption&gt; Table Caption</caption>
	<tr>
		<th scope="col">&lt;th&gt; Heading</th>
		<th scope="col">&lt;th&gt; Heading</th>
		<th scope="col">&lt;th&gt; Heading</th>
		<th scope="col">&lt;th&gt; Heading</th>
	</tr>
	<tr>
		<th scope="row">&lt;th&gt; Heading</th>
		<td>content</td>
		<td>content</td>
		<td>content</td>
	</tr>
	<tr class="row-alternating">
		<th scope="row">&lt;th&gt; Heading</th>
		<td>content</td>
		<td>content</td>
		<td>content</td>
	</tr>
	<tr>
		<th scope="row">&lt;th&gt; Heading</th>
		<td>content</td>
		<td>content</td>
		<td>content</td>
	</tr>
	<tr class="row-alternating">
		<th scope="row">&lt;th&gt; Heading</th>
		<td>content</td>
		<td>content</td>
		<td>content</td>
	</tr>
</table>
<div class="three-column-container">
<div class="three-column-left">
<h3>&lt;h3&gt; Header</h3>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat
volutpat.</p>
</div>
<div class="three-column-middle">
<h3>&lt;h3&gt; Header</h3>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat
volutpat.</p>
</div>
<div class="three-column-right">
<h3>&lt;h3&gt; Header</h3>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat
volutpat.</p>
</div>
<div class="clear"></div>
</div>
<fieldset><legend>&lt;legend&gt; Legend</legend> <label
	for="name">&lt;label&gt; Label </label> <input class="input-box"
	name="name" id="name" type="text" size="50" /> <label for="email">&lt;label&gt;
Label </label> <input class="input-box" name="email" id="email" type="text"
	size="50" /> <label for="notesfield">&lt;label&gt; Label </label> <textarea
	class="input-box" name="notesfield" cols="50" rows="4" id="notesfield"></textarea>
<label for="favmag1">&lt;label&gt; Label </label> <select id="favmag1"
	name="favmag1">
	<option value="0" selected="selected">- - Select your favorite
	magazine - -</option>
	<optgroup label="General Computer Magazines">
		<option value="1">Computer A Magazine</option>
		<option value="2">Computer B Magazine</option>
		<option value="3">Computer C Magazinee</option>
	</optgroup>
	<optgroup label="Software Magazines">
		<option value="5">Software A Magazine</option>
		<option value="6">Software B Magazine</option>
		<option value="7">Software C Magazine</option>
	</optgroup>
	<optgroup label="Hardware Magazine">
		<option value="8">Hardware A Magazine</option>
		<option value="9">Hardware B Magazinek</option>
		<option value="10">Hardware C Magazine</option>
	</optgroup>
</select>
<fieldset><legend>Lorem ipsum dolar</legend> <label
	class="no-margin" for="radio1"> <input class="inline"
	type="radio" name="radio" id="radio1" title="&lt;label&gt; Label"
	checked="checked" /> &lt;label&gt; Label </label> <label class="no-margin"
	for="radio2"> <input class="inline" type="radio" name="radio"
	id="radio2" title="&lt;label&gt; Label" /> &lt;label&gt; Label </label> <label
	class="no-margin" for="radio3"> <input class="inline"
	type="radio" name="radio" id="radio3" title="&lt;label&gt; Label" />
&lt;label&gt; Label </label></fieldset>
<div class="checkbox"><label class="no-margin" for="check1">
<input class="inline" title="Subscribe" type="checkbox" name="check1"
	id="check1" value="" /> &lt;label&gt; Label </label></div>
<input class="button button-big" name="Submit" type="button"
	value="Submit" /> <input class="button button-big" name="Submit2"
	type="reset" value="Reset" /></fieldset>
	--%>
	
			</div>
			<div class="content-left">
				<div class="side-bucket" id="MenuIzquierda"><!-- Menu izquierda --></div>
			</div>
			<!--<div class="content-right"></div>
			--><div class="clear"></div>
		</div>
	</div>
	<div class="footer">
		<div class="nav-footer">
			<ul>
				<li class="first">
					<a href="/">Inicio</a>
				</li>
				<li>
					<a href="javascript:abrirContenido('/acerca/');">Acerca</a>
				</li>
			</ul>
			<p class="copyright">&copy; 2009 Sistema Servicio T&#233;cnico</p>
		</div>
	</div>
</body>
</html>
