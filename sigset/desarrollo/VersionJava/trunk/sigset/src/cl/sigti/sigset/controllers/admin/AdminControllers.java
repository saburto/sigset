package cl.sigti.sigset.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.servicios.admin.UsuarioServicio;

@Controller()
@RequestMapping("/admin")
public class AdminControllers {
	
	@Autowired
	UsuarioServicio usuarioServicio;
	
	
	
	@RequestMapping("/")
	public ModelAndView inicio(){
		ModelAndView modelAndView = new ModelAndView("admin/inicio");
		modelAndView.addObject("usuarios", usuarioServicio.getUsuarios());
		modelAndView.addObject("usuario", new Usuario());
		return modelAndView;
	}
	
	@RequestMapping(value="/crear/", method=RequestMethod.POST)
	public String crear(@ModelAttribute Usuario usuario){
		
		return "redirect:/admin/";
	}
}
