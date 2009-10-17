package cl.sigti.sigset.repositorios.perfil;

import org.springframework.stereotype.Repository;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Perfil;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class PerfilRepositorioImpl extends RepositorioBaseImpl<Perfil> implements PerfilRepositorio {

	
	public PerfilRepositorioImpl() {
		super(Perfil.class);
		// TODO Auto-generated constructor stub
	}
    
	@Override
	public Perfil Create(Perfil obj) {
		Key key = KeyFactory.createKey(Perfil.class.getSimpleName(), obj.getDescripcion());
		obj.setId(key);
		return super.Create(obj);
	}
	
	
	

}
