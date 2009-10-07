package cl.sigti.sigset.controllers.config;
import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.servicios.config.ConfiguracionServicioImpl;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	

	@RequestMapping("/lista/")
	public ModelAndView lista()
	{
		Empresa empresa = new Empresa();		
		List<Usuario> usuarios = null;
	//	usuarios = (empresa);
		ModelAndView modelAndView = new ModelAndView("config/lista");
		return modelAndView;
	}
}
