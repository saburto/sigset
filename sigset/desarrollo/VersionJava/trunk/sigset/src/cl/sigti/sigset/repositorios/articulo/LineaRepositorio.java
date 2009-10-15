package cl.sigti.sigset.repositorios.articulo;

import java.util.List;

import cl.sigti.sigset.modelo.Linea;

public interface LineaRepositorio {

	public abstract List<Linea> getLineas(String nombre);

	public abstract Linea getMarcaPorNombre(String lineaNombre);

	public abstract Linea crearMarca(String linea);

}