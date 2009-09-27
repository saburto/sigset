package cl.sigti.sigset.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomBooleanEditor;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

import cl.sigti.sigset.util.GoogleDatastoreKeyEditor;

public class InitBinder implements WebBindingInitializer {
	
	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		binder.registerCustomEditor(String.class,
				new StringTrimmerEditor(false));
		
		binder.registerCustomEditor(Long.class, new CustomNumberEditor(Long.class, true));
		binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
		binder.registerCustomEditor(Double.class, new CustomNumberEditor(Double.class, true));
		

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
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
