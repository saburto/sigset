package cl.sigti.sigset.util.json;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.validation.ObjectError;

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

	public void setErrores(List<ObjectError> allErrors) {
		this.errores = new String[allErrors.size()];
		for(int i =0;i<allErrors.size();i++){
			errores[i]= allErrors.get(i).getDefaultMessage();
		}
	}

}
