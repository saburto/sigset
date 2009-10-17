package cl.sigti.sigset.controllers.sistema;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cl.sigti.sigset.modelo.Perfil;
import cl.sigti.sigset.servicios.perfil.PerfilServicio;

@Controller
@RequestMapping("/perfil")
public class PerfilController {

	@Autowired
	PerfilServicio perfilServicio;
	
	
	
	@RequestMapping("/crear/")
	public String crearPerfil() {
		return "sistema/perfil/crear";

	}	
	
	@RequestMapping(value = "/crear/", method = RequestMethod.POST)
	public String crearPerfil(@ModelAttribute Perfil perfil) {
		perfilServicio.crearPerfil(perfil);
		return "sistema/perfil/crear";

	}
	
}
