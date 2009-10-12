package cl.sigti.sigset.repositorios.articulo;

import org.springframework.stereotype.Repository;

import cl.sigti.sigset.modelo.Articulo;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class ArticuloRepositorioImpl extends RepositorioBaseImpl<Articulo> {

	public ArticuloRepositorioImpl() {
		super(Articulo.class);
	}

	
}
