package cl.sigti.sigset.repositorios.empresa;

import org.springframework.stereotype.Repository;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class EmpresaRepositorioImpl extends RepositorioBaseImpl<Empresa> implements EmpresaRepositorio {

	public EmpresaRepositorioImpl() {
		super(Empresa.class);
	}
	
	@Override
	public Empresa Create(Empresa obj) {
		Key key = KeyFactory.createKey(Empresa.class.getSimpleName(), obj.getNombreCorto());
		obj.setId(key);
		return super.Create(obj);
	}
	
}
