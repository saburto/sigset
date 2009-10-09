package cl.sigti.sigset.servicios.config;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.repositorios.config.ConfiguracionRepositorio;
import cl.sigti.sigset.repositorios.config.ConfiguracionRepositorioImpl;





@SuppressWarnings({ "unused" })
@Service
public class ConfiguracionServicioImpl implements ConfiguracionServicio{
 
   ConfiguracionRepositorio repo = new ConfiguracionRepositorioImpl();
	
	/* (non-Javadoc)
	 * @see cl.sigti.sigset.servicios.config.ConfiguracionServicio#listarUsuarios(cl.sigti.sigset.modelo.Empresa)
	 */
	public List<Usuario> listarUsuarios(Empresa empresa)
	{
		return (List<Usuario>) listarUsuarios(empresa);		
	}
	
	

}
