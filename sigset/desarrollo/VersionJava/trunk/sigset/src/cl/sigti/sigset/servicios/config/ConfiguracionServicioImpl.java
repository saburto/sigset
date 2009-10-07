package cl.sigti.sigset.servicios.config;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.repositorios.config.ConfiguracionRepositorio;


@Service
public class ConfiguracionServicioImpl  implements ConfiguracionServicio{
 
	@Autowired
   private ConfiguracionRepositorio configuracionRepositorio;
   
	public List<Usuario> listarUsuarios(Empresa empresa)
	{
		return (List<Usuario>) listarUsuarios(empresa);		
	}
	
	

}
