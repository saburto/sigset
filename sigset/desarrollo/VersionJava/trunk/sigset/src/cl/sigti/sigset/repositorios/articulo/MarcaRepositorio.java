package cl.sigti.sigset.repositorios.articulo;

import java.util.List;

import cl.sigti.sigset.modelo.Marca;

public interface MarcaRepositorio {

	public abstract List<Marca> getMarcas(String nombre);

	public abstract Marca getMarcaPorNombre(String marcaNombre);

	public abstract Marca crearMarca(String marca);

	

}