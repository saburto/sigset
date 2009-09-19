package cl.sigti.sigset.repositorios;

import java.util.List;

import javax.jdo.PersistenceManager;
import java.util.logging.Logger;



import cl.sigsit.sigset.persistencia.PMF;

public class RepositorioBaseImpl<E> implements RepositorioBase<E> {
	
	 private static final Logger log = Logger.getLogger(RepositorioBaseImpl.class.getName());

	private Class<E> type;
	
	private PersistenceManager pm = PMF.get().getPersistenceManager();
	
	public RepositorioBaseImpl(Class<E> type){
		this.type = type;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<E> getAll(){
		List<E> lista = null;
		try{
		    String query = "select from " + type.getName();
		    lista = (List<E>) pm.newQuery(query).execute();
		    lista.size();
		}
		catch(Exception ex){
			log.severe(ex.getMessage());
		}
	    return lista;
	}


	@Override
	public E Create(E obj) {
		pm.makePersistent(obj);
		return null;
	}


	@Override
	public boolean Delete(E obj) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public E Update(E obj) {
		// TODO Auto-generated method stub
		return null;
	}
}
