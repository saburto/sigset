package cl.sigti.sigset.repositorios.config;

import java.util.List;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.repositorios.RepositorioBase;

public interface ConfiguracionRepositorio extends RepositorioBase<Usuario> {

	public abstract List<Usuario> UsuariosEmpresa(Empresa empresa);

}