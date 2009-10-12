package cl.sigti.sigset.repositorios.articulo;

import java.util.List;

import cl.sigti.sigset.modelo.Linea;

public interface LineaRepositorio {

	@SuppressWarnings("unchecked")
	public abstract List<Linea> getLineas(String nombre);

	@SuppressWarnings("unchecked")
	public abstract Linea getMarcaPorNombre(String lineaNombre);

	public abstract Linea crearMarca(String linea);

}