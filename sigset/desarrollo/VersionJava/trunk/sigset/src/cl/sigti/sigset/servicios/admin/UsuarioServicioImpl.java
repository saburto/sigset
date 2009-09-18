package cl.sigti.sigset.servicios.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.repositorios.admin.UsuarioRepositorio;

@Service
public class UsuarioServicioImpl implements UsuarioServicio {

	@Autowired
	UsuarioRepositorio usuarioRepositorio;
	
	@Override
	public List<Usuario> getUsuarios() {
		return usuarioRepositorio.getAll();
	}

}
