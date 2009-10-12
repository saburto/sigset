package cl.sigti.sigset.util;

import java.io.IOException;
import java.io.StringWriter;

import org.codehaus.jackson.map.ObjectMapper;

public class FormResult {

	private String url;
	private String mensajeError;
	private String mensajeSucces;
	private String[] errores;

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

	public void setMensajeSucces(String mensajeSucces) {
		this.mensajeSucces = mensajeSucces;
	}

	public String getMensajeSucces() {
		return mensajeSucces;
	}

	public void setMensajeError(String mensajeError) {
		this.mensajeError = mensajeError;
	}

	public String getMensajeError() {
		return mensajeError;
	}

	public void setErrores(String[] errores) {
		this.errores = errores;
	}

	public String[] getErrores() {
		return errores;
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

}
