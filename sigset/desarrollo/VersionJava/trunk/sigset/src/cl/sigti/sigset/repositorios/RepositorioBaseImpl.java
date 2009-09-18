package cl.sigti.sigset.repositorios;

import java.util.List;

import javax.jdo.PersistenceManager;

import cl.sigsit.sigset.persistencia.PMF;

public class RepositorioBaseImpl<E> implements RepositorioBase<E> {
	private Class<E> type;
	
	public RepositorioBaseImpl(Class<E> type){
		this.type = type;
	}
	
	
	/* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.RepositorioBase#getAll()
	 */
	public List<E> getAll(){

		PersistenceManager pm = PMF.get().getPersistenceManager();
	    String query = "select from " + type.getName();
	    List<E> lista = (List<E>) pm.newQuery(query).execute();
	    int apiSize = lista.size();
	    return lista;
	}
}
