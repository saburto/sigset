package cl.sigti.sigset.util;

import java.beans.PropertyEditorSupport;
import java.util.logging.Logger;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class GoogleDatastoreKeyEditor extends PropertyEditorSupport {
	 
	  private static final Logger log = Logger.getLogger(GoogleDatastoreKeyEditor.class.getName());
	 
	  @Override
	  public void setAsText(String text) {
	    if (text == null || text.length() == 0) {
	      setValue(null);
	    } else {
	      Key key = null;
	      try {
	        key = KeyFactory.stringToKey(text);
	      } catch (Exception e) {
	        log.severe("Cannot parse key: " + text);
	      }
	      setValue(key);
	    }
	  }
	 
	  @Override
	  public String getAsText() {
	    Key value = (Key) getValue();
	    return (value != null ? KeyFactory.keyToString(value) : "");
	  }
	}