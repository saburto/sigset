package cl.sigti.sigset.controllers.ordenTrabajo;

import java.beans.PropertyEditorSupport;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import cl.sigti.sigset.modelo.Cliente;
import cl.sigti.sigset.modelo.ClienteComercial;
import cl.sigti.sigset.modelo.ClienteParticular;

@RequestMapping("/orden")
@Controller
public class OrdenTrabajoController {
	
	
	@RequestMapping("/menu/")
	public ModelAndView menu(){
		//TODO: llamar a servico de autorizacion y cargar permisos a los menus.
		ModelAndView modelAndView = new ModelAndView("orden/menu");
		return modelAndView;
	}
	
	@RequestMapping("/")
	public String inicio(Model model){
		return crear(model);
	}

	@RequestMapping("/crear/")
	public String crear(Model model){

		model.addAttribute("cliente", new Cliente());
		return "orden/crear";
	}
	
	@RequestMapping(value="/crear/", method= RequestMethod.POST)
	public String crearSubmit(	@ModelAttribute ClienteComercial clienteComercial,
								@ModelAttribute ClienteParticular clienteParticular,
								@RequestParam String observacion){
		
		
		return "orden/crear";
	}
	
	
	
	@RequestMapping(value="/crear2/{nombre}", method= RequestMethod.GET)
	public ModelAndView crear(@PathVariable String nombre){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("orden/crear2");
		modelAndView.addObject("nombre", nombre.toUpperCase());
	
	return modelAndView;
	}
	
	
	
	
}
