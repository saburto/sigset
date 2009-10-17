package cl.sigti.sigset.controllers.sistema;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cl.sigti.sigset.modelo.Modulos;
import cl.sigti.sigset.servicios.modulos.ModuloServicio;

@Controller
@RequestMapping("/modulos")
public class ModuloController {

	@Autowired
	ModuloServicio modulosServicio;

	@RequestMapping("/crear/")
	public String crearModulos() {
		return "sistema/modulos/crear";
	}

	@RequestMapping(value = "/crear/", method = RequestMethod.POST)
	public String crearModulos(@ModelAttribute Modulos modulo) {
		modulosServicio.crearModulo(modulo);
		return "sistema/modulos/crear";
	}

	
	@RequestMapping("/listar/")
	public String listarModulos(Model model) {
		model.addAttribute("modulos",  modulosServicio.listarModulos()); 		
		return "sistema/modulos/listar";
	}
}
