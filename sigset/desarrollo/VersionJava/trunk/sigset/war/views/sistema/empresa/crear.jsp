<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div id="tabs">
	<ul>
		<li><a href="#empresa">Datos Empresa</a></li>
		<li><a href="#contrato">Datos Contrato</a></li>
	</ul>
	<form  method="post" action="/sistema/empresa/crear" id="formularioEmpresa">					
		<div id="empresa">
			<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
					<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
			</div>	
	   		<fieldset>		
					<legend>Crear Empresa</legend>
					<div class="three-column-container">
					
						<div  class="three-column-left">
					 		<label>Rut:</label>				 	
					 		<input type="text" name="rut" title="Rut de Empresa Ej(12345456-9)" class="required rut" />
					 	</div>
						<div  class="three-column-left">
					 		<label>Raz&oacute;n social:</label>				 	
					 		<input type="text" name="nombre" title="Nombre Raz&oacute;n social" type="text" class="required lettersonly" />
					 	</div>
						<div  class="three-column-rigth">		
					 		<label>Nombre Corto:</label>				 	
					 		<input type="text" name="nombreCorto" title="Nombre corto" type="text" class="required lettersonly"  />			 
					    </div>
					    					
					</div>
			</fieldset>
			
			<div>
		    <fieldset>
			   <legend>Direcci&oacute;n</legend>
		            <div class="three-column-container">
		            	<div class="three-column-left">
							<label for="calle">Calle:</label>
							<input type="text" name="calle" class="required" />
						</div>
		            	<div class="three-column-middle">
							<label for="numero">Numero:</label>
							<input type="text" name="numero" class="required" />
		            	</div>
		           	</div>
		            <div class="three-column-container">
		            	<div class="three-column-left">
							<label for="region">Regi&oacute;n:</label>
							<input id="Region_DISPLAY_TEXT" name="Region_DISPLAY_TEXT" type="text" value="" />
							<input id="region" name="region" type="hidden" value="" class="required" />
		    	        </div>
			    	    <div class="three-column-middle">
							<label for="provincia">Provincia:</label>
							<input id="Provincia_DISPLAY_TEXT" name="Provincia_DISPLAY_TEXT" type="text" value="" />
							<input id="provincia" name="provincia" type="hidden" value="" class="required" />
							
		            	</div>
		            	<div class="three-column-right">
							<label for="comuna">Comuna:</label>
							<input id="Comuna_DISPLAY_TEXT" name="Comuna_DISPLAY_TEXT" type="text" value="" />
							<input id="comuna" name="comuna" type="hidden" value="" class="required"  />
							
		            	</div>
		            </div>
        	</fieldset>
			</div>
	        
			  <fieldset>
						<legend>Contacto</legend>
						<div class="three-column-container">
						<div class="three-column-left">
							<label for="rut">Email:</label>
							<input type="text" name="contactoEmail" class="email" />
						</div>
						<div class="three-column-left">
							<label for="rut">Telefono:</label>
							<input type="text" name="contactoTelefono" class="required digits"  />
						</div>
						</div>
			  </fieldset>
			  <fieldset>
						<div style="text-align: right;float: right;">
							<input type="submit" class="button-big" value="Siguiente" />
						</div>
		 	  </fieldset>
		</div>	
		<div id="contrato"> 
			<div class="errorContainer ui-state-error ui-corner-all" style="display:none;">
					<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><span  class="errorMessage"></span></p>
			</div>	
				  <fieldset>
		 		     <legend>Datos Contrato</legend>
						
						<div class="three-column-container">
						
							<div  class="three-column-left">
							 		<label>Usuario Encargado:</label>				 	
							 		<input type="text" name="usuarioEncargado" />
							 		<label>Limite de usuarios:</label>				 	
							 		<input type="text" name="limiteUsuario" />
						 	</div>
							<div  class="three-column-left">
							 		<label>Inicio Contrato:</label>	
							 		<input type="text" name="inicioContrato" id="inicioContrato" />
							</div> 
							
							<div  class="three-column-right;">
								 	<label>Fin Contrato:</label>
								 	<input type="text" name="finContrato" id="finContrato" />   				
							</div>
								
						</div>			
						
				</fieldset>	
			    <fieldset>
					    <legend>Estado</legend>
					    
					     <div class="three-column-container">
               					 <div class="three-column-left">
					   			   <p>	                
				                    <label for="activo" style="display:inline !important;">Activo:</label>
				                    <label for="si" style="display:inline !important;" >Si:</label>
				                    <input type="radio" id="true" name="activo" value="1">
				                	<label for="no" style="display:inline !important;" >No:</label>
				                    <input type="radio" id="false" name="activo" value="2">
				            			         
				           		</p>
				           </div>
				        </div>
				   													    
				</fieldset>   		   
				<fieldset>
					    <legend>Otros</legend>
						<label for="observacion">Observaciones</label>
						<textarea name="observaciones"></textarea>				
				</fieldset>	
				<fieldset>
					 	 <div style="text-align: left;float: left;">
								<input 
								type="button" 
								class="button-big" 
								value="Anterior" 
								id="anterior"
								onclick="irAnteriorDe(1,'empresa')"
								/>
	      				 </div>
						 <div style="text-align: right;float: right;">
								<input type="submit" class="button-big" value="Guardar" />
						 </div>
				</fieldset>
		</div>	
	</form>
</div>
<script type="text/javascript" language="javascript">
InitForm = function () {

	
	//$('#tabs').tabs('option', 'disabled', [1, 2]);
	//$("#articulo input").attr("disabled","disabled");
	//$("#orden input").attr("disabled","disabled");
	
	$("#formularioEmpresa").validate({
		invalidHandler: function(e, validator) {
			var errors = validator.numberOfInvalids();
			if (errors) {
				var message = errors == 1
					? 'Hay un campo que no se ha completado correctamente'
					: 'Hay ' + errors + ' campos que no se han completado correctamente.';
				$(".errorMessage").html(message);
				$(".errorContainer").show();
			} else {
				$(".errorContainer").hide();
			}
			},
			submitHandler:function(form){
				//$('#tabs').tabs('option', 'disabled', [1, 2]);
				$('#tabs').tabs( 'enable' , 1);
				$('#tabs').tabs( 'select' , 1 );
				$("#contrato input").removeAttr("disabled");
				$.scrollTo("contrato");				 
			}
		});


		$("#formularioEmpresa input").tooltip({ 
				 
			    track: true, 
			    delay: 0, 
			    showURL: false, 
			    showBody: " - ", 
			    fade: 250,
			    opacity:1
			    //extraClass:"tooltip"
		 
		});	
		
		
		$('#inicioContrato').datepicker();
		$('#finContrato').datepicker();

		 $('#Region_DISPLAY_TEXT').autocomplete('/util/encontrarRegiones', {
		    	mustMatch: true, selectFirst:true,
		    	 
		    	            autoFill: false,
		    	            max: 15,
		    	            cacheLength:0,
		    	            delay:100,
		    	            minChars:0,
		    	            dataType:'json',
		    	            parse: function(data)
		    	            {
		    	                var array = new Array();
		    	                for(var i=0;i<data.length;i++) 
		    	                {
		    	                    array[i] = { data:data[i], value: data[i].value, result: data[i].display};
		    	                }
		    	                return array;
		    	            },
		    	            formatItem: function(data,i,max,value,term) {
		    				return data.display;}
		    	   });
		    	 
		    	   $('#Region_DISPLAY_TEXT').result(function(e, d, f) {
		    	       $('#region').val(d.value);
		    	    });
		    	 
		    	 
		    	    
		    	 $('#Provincia_DISPLAY_TEXT').autocomplete('/util/encontrarProvincias', {
		    	mustMatch: true, selectFirst:true,
		    	 
		    	            autoFill: false,
		    	            max: 30,
		    	            cacheLength:0,
		    	            delay:100,
		    	            minChars:0,
		    	            dataType:'json',
		    	            parse: function(data)
		    	            {
		    	                var array = new Array();
		    	                for(var i=0;i<data.length;i++) 
		    	                {
		    	                    array[i] = { data:data[i], value: data[i].value, result: data[i].display};
		    	                }
		    	                return array;
		    	            },
		    	            formatItem: function(data,i,max,value,term) {
		    				return data.display;}
		    	, extraParams : { Region:function(){return $('#region').val();}}
		    	   });
		    	 
		    	   $('#Provincia_DISPLAY_TEXT').result(function(e, d, f) {
		    	       $('#provincia').val(d.value);
		    	    });
		    	 
		    	 
		    	    
		    	 $('#Comuna_DISPLAY_TEXT').autocomplete('/util/encontrarComunas', {
		    	mustMatch: true, selectFirst:true,
		    	 
		    	            autoFill: false,
		    	            max: 100,
		    	            cacheLength:0,
		    	            delay:100,
		    	            minChars:0,
		    	            dataType:'json',
		    	            parse: function(data)
		    	            {
		    	                var array = new Array();
		    	                for(var i=0;i<data.length;i++) 
		    	                {
		    	                    array[i] = { data:data[i], value: data[i].value, result: data[i].display};
		    	                }
		    	                return array;
		    	            },
		    	            formatItem: function(data,i,max,value,term) {
		    				return data.display;}
		    	, extraParams : { Provincia:function(){return $('#provincia').val();}}
		    	   });
		    	 
		    	   $('#Comuna_DISPLAY_TEXT').result(function(e, d, f) {
		    	       $('#comuna').val(d.value);
		    	    });

		};

function irAnteriorDe(indexTabActual, idTabAnterior){
	$("#tabs").tabs( 'select' , indexTabActual - 1 );
	$.scrollTo("#" + idTabAnterior );
}

		
</script>


