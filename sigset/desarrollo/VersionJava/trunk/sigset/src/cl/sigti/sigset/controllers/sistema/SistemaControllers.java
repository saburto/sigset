package cl.sigti.sigset.controllers.sistema;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller()
@RequestMapping("/sistema")
public class SistemaControllers {


	@RequestMapping("/")
	public String inicio() {
		return "sistema/empresa/crear"; 									
	}

	@RequestMapping("/menu/")
	public ModelAndView menu() {
		// TODO: llamar a servico de autorizacion y cargar permisos a los menus.
		ModelAndView modelAndView = new ModelAndView("sistema/menu");
		return modelAndView;
	}



	
}
