package cl.sigti.sigset.servicios.config;

import java.util.List;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.repositorios.RepositorioBase;

@SuppressWarnings("unused")
public interface ConfiguracionServicio {

	public abstract List<Usuario> listarUsuarios(Empresa empresa);

}