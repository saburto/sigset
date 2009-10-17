package cl.sigti.sigset.repositorios.modulos;

import org.springframework.stereotype.Repository;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Modulos;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class ModuloRepositorioImpl extends RepositorioBaseImpl<Modulos> implements ModuloRepositorio {

	public ModuloRepositorioImpl() {
		super(Modulos.class);
	}

	@Override
	public Modulos Create(Modulos obj) {
		Key key = KeyFactory.createKey(Modulos.class.getSimpleName(), obj.getNombreModulo());
		obj.setId(key);
		return super.Create(obj);
	}
}
