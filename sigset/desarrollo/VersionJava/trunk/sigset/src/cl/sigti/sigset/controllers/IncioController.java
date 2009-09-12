package cl.sigti.sigset.controllers;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IncioController {

	@RequestMapping("/")
	public String Index(){
		return Inicio();
	}
	
	@RequestMapping("/inicio/")
	public String Inicio() {
		return "inicio/inicio";
	}
	
}
