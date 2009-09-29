package cl.sigti.sigset.servicios.orden;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.OrdenTrabajo;
import cl.sigti.sigset.repositorios.orden.OrdenTrabajoRepositorio;

@Service
public class OrdenTrabajoServicioImpl {
	
	@Autowired
	private OrdenTrabajoRepositorio repositorio;
	
	public List<OrdenTrabajo> GetTodasLasOrdenes()
	{
		return repositorio.getAll();
	}
	
}
