package cl.sigti.sigset.servicios.modulos;

import java.util.List;


import cl.sigti.sigset.modelo.Modulos;

public interface ModuloServicio {

	public void crearModulo(Modulos modulo);
	public List<Modulos> listarModulos();

}
