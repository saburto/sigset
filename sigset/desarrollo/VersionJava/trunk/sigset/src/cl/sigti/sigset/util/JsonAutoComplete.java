package cl.sigti.sigset.util;

import java.io.IOException;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

public class JsonAutoComplete {
	private String value;
	private String display;

	public JsonAutoComplete(String value, String display) {
		this.value = value;
		this.display = display;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getDisplay() {
		return display;
	}

	public String ToJson() {
		try {
			StringWriter writer = new StringWriter();
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(writer, this);
			writer.flush();
			return writer.getBuffer().toString();
		} catch (IOException e) {
			return "";
		}
	}

	public static String ToJson(Collection<JsonAutoComplete> list) {
		try {
			StringWriter writer = new StringWriter();
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(writer, list);
			writer.flush();
			return writer.getBuffer().toString();
		} catch (IOException e) {
			return "";
		}
	}

	@SuppressWarnings("unchecked")
	private static Collection<JsonAutoComplete> CrearLista(
			Collection<? extends Object> lista, String value, String display) {
		List<JsonAutoComplete> listaJson = new ArrayList<JsonAutoComplete>();
		String propValue = "get" + Character.toUpperCase(value.charAt(0))
				+ value.substring(1);
		String propDisplay = "get" + Character.toUpperCase(display.charAt(0))
				+ display.substring(1);
		Class[] types = new Class[] {};
		if (lista != null) {
			for (Object o : lista) {
				try {

					listaJson.add(new JsonAutoComplete(o.getClass().getMethod(
							propValue, types).invoke(o).toString(), o
							.getClass().getMethod(propDisplay, types).invoke(o)
							.toString()));
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return listaJson;
	}

	public String ToString() {
		return ToJson();
	}

	public static String ToJson(Collection<? extends Object> lista,
			String value, String display) {
		return ToJson(CrearLista(lista, value, display));
	}
}
