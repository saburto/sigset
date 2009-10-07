package cl.sigti.sigset.repositorios.config;

import java.util.List;

import org.springframework.stereotype.Repository;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

import javax.jdo.PersistenceManager;
import java.util.logging.Logger;

import cl.sigti.sigset.persistencia.PMF;

@Repository
public class ConfiguracionRepositorioImpl extends RepositorioBaseImpl<Usuario>
		implements ConfiguracionRepositorio {

	private static final Logger log = Logger
			.getLogger(RepositorioBaseImpl.class.getName());
	private PersistenceManager pm = PMF.get().getPersistenceManager();

	public ConfiguracionRepositorioImpl() {
		super(Usuario.class);
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> UsuariosEmpresa(Empresa empresa) {

		List<Usuario> usuarios = null;
		try {
			String query = ("select from Usuario "
					+ "where Empresa.class == empresa ");
			usuarios = (List<Usuario>) pm.newQuery(query).execute();
			usuarios.size();
			
		} catch (Exception ex) {
			log.severe(ex.getMessage());
		}
		return usuarios;

	}

}
