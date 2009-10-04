package cl.sigti.sigset.repositorios.orden;

import org.springframework.stereotype.Repository;

import cl.sigti.sigset.modelo.OrdenTrabajo;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class OrdenTrabajoRepositorioImpl extends RepositorioBaseImpl<OrdenTrabajo> implements OrdenTrabajoRepositorio {

	public OrdenTrabajoRepositorioImpl() {
		super(OrdenTrabajo.class);
	}



}
