package cl.sigti.sigset.servicios.modulos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Modulos;
import cl.sigti.sigset.repositorios.modulos.ModuloRepositorio;

@Service
public class ModuloServicioImpl implements ModuloServicio {

	@Autowired
	ModuloRepositorio repo;

	@Override
	public void crearModulo(Modulos modulo) {
		repo.Create(modulo);

	}

	@Override
	public List<Modulos> listarModulos() {

		return repo.getAll();
	}

}
