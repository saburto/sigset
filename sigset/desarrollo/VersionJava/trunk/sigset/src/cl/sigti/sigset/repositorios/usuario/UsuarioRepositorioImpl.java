package cl.sigti.sigset.repositorios.usuario;

import org.springframework.stereotype.Repository;

import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class UsuarioRepositorioImpl extends RepositorioBaseImpl<Usuario> implements UsuarioRepositorio {

	public UsuarioRepositorioImpl() {
		super(Usuario.class);
	}

}
