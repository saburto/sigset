<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<fieldset>
	<legend>Direcci&oacute;n</legend>
	<div class="three-column-container">
    	<div class="three-column-left">
			<label for="calle">Calle:</label>
			<input type="text" name="calle" class="required" />
		</div>
		<div class="three-column-middle">
			<label for="numero">N&uacute;mero:</label>
			<input type="text" name="numero" class="required" />
       	</div>
  	</div>
	<div class="three-column-container">
	  	<div class="three-column-left">
			<label for="region">Regi&oacute;n:</label>
			<input id="Region_DISPLAY_TEXT" name="Region_DISPLAY_TEXT" type="text" value="" class="required" />
			<input id="region" name="region" type="hidden" value=""  />
        </div>
 	    <div class="three-column-middle">
			<label for="provincia">Provincia:</label>
			<input id="Provincia_DISPLAY_TEXT" name="Provincia_DISPLAY_TEXT" type="text" value="" class="required" />
			<input id="provincia" name="provincia" type="hidden" value=""  />
    	</div>
    	<div class="three-column-right">
			<label for="comuna">Comuna:</label>
			<input id="Comuna_DISPLAY_TEXT" name="Comuna_DISPLAY_TEXT" type="text" value="" class="required" />
			<input id="comuna" name="comuna" type="hidden" value=""   />
       	</div>
	</div>
<script type="text/javascript">
	$('#Region_DISPLAY_TEXT').autocomplete('/util/encontrarRegiones', {
				mustMatch: true, 
				selectFirst:true,
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
				mustMatch: true, 
				selectFirst:true,
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
</script>
</fieldset>