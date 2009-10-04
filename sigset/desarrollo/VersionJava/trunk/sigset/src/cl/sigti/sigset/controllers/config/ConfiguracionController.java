package cl.sigti.sigset.controllers.config;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/config")
public class ConfiguracionController {
	
	@RequestMapping("/menu/")
	public ModelAndView menu(){
		//TODO: llamar a servico de autorizacion y cargar permisos a los menus.
		ModelAndView modelAndView = new ModelAndView("config/menu");
		return modelAndView;
	}
}
