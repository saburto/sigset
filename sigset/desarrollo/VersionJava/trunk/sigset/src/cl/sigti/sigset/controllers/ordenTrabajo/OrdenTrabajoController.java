package cl.sigti.sigset.controllers.ordenTrabajo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cl.sigti.sigset.modelo.Marca;

@RequestMapping("/orden")
@Controller
public class OrdenTrabajoController {

	@RequestMapping("/crear/")
	public String crear(){
		return "orden/crear";
	}
	
	@RequestMapping(value="/crear2/{nombre}", method= RequestMethod.GET)
	public ModelAndView crear(@PathVariable String nombre){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("orden/crear2");
		modelAndView.addObject("nombre", nombre.toUpperCase());
		
		return modelAndView;
	}
	
	@RequestMapping("/crear3/")
	public String crear(Model model){
		model.addAttribute("nombre", "ruminitaaaa");
		Marca marca = new Marca();
		marca.setDescripcion("descripcion de la super marca");
		model.addAttribute("obj", marca);
		return "orden/crear2";
	}
	
	
	
}
