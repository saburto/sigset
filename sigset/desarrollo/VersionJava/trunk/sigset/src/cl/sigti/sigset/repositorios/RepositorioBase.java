package cl.sigti.sigset.repositorios;

import java.util.List;

public interface RepositorioBase<E> {

	public abstract List<E> getAll();

}