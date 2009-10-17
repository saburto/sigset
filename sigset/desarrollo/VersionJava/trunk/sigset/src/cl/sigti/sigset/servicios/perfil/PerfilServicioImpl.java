package cl.sigti.sigset.servicios.perfil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Perfil;
import cl.sigti.sigset.repositorios.perfil.PerfilRepositorio;

@Service
public class PerfilServicioImpl implements PerfilServicio {
	
	@Autowired
	PerfilRepositorio repo;

	@Override
	public void crearPerfil(Perfil perfil) {
		
      repo.Create(perfil);
		
	}

}
