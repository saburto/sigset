package cl.sigti.sigset.controllers.informes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/informes")
public class InformeController {

	@RequestMapping("/menu/")
	public ModelAndView menu(){
		//TODO: llamar a servico de autorizacion y cargar permisos a los menus.
		ModelAndView modelAndView = new ModelAndView("informes/menu");
		return modelAndView;
	}
}
