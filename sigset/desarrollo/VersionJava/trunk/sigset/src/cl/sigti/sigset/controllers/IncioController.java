package cl.sigti.sigset.controllers;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IncioController {


	/***
	 * Action de inicio, de ruta por defecto "/"
	 * @return
	 */
	@RequestMapping("/")
	public String Index(){
		return Inicio();
	}
	
	@RequestMapping("/inicio/")
	public String Inicio() {
		return "inicio/inicio2";
	}
	
	@RequestMapping("/sistema/prueba/")
	public String about(Model model){
		SecurityContextHolder.getContext().getAuthentication().getDetails();
		SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("usuario","");
		return "sistema/prueba";
	}
	
	
}
