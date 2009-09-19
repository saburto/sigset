package cl.sigti.sigset.repositorios;

import java.util.List;

public interface RepositorioBase<E> {

	public abstract List<E> getAll();
	public abstract E Create(E obj);
	public abstract boolean Delete(E obj);
	public abstract E Update(E obj);

}