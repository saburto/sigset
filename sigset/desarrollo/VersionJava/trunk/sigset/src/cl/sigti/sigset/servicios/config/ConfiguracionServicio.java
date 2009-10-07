package cl.sigti.sigset.servicios.config;

import java.util.List;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;

public interface ConfiguracionServicio {
	
	public abstract List<Usuario> listarUsuarios(Empresa empresa);
}
