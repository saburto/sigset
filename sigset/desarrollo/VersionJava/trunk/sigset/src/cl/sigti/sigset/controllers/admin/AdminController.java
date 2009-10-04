package cl.sigti.sigset.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/menu/")
	public ModelAndView menu(){
		//TODO: llamar a servico de autorizacion y cargar permisos a los menus.
		ModelAndView modelAndView = new ModelAndView("admin/menu");
		return modelAndView;
	}
	
}
