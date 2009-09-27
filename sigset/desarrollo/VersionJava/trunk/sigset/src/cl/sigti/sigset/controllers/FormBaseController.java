package cl.sigti.sigset.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomBooleanEditor;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import cl.sigti.sigset.util.GoogleDatastoreKeyEditor;

public class FormBaseController {
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {

		binder.registerCustomEditor(String.class,
				new StringTrimmerEditor(false));
		
		binder.registerCustomEditor(Long.class, new CustomNumberEditor(Long.class, true));
		binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
		binder.registerCustomEditor(Double.class, new CustomNumberEditor(Double.class, true));
		

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Boolean.class, new CustomBooleanEditor(
				false));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));

		binder.registerCustomEditor(com.google.appengine.api.datastore.Key.class,
				new GoogleDatastoreKeyEditor());

		binder.registerCustomEditor(List.class, new CustomCollectionEditor(
				List.class));
	}
	

}
