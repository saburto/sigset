package cl.sigti.sigset.servicios.usuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.repositorios.usuario.UsuarioRepositorio;

@Service
public class UsuarioServicioImpl {

	@Autowired
	UsuarioRepositorio repo;
	
	public void crearUsuario(Usuario usuario)
	{
	
		repo.Create(usuario);
		
	}
}
