package cl.sigti.sigset.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IncioController {

	@RequestMapping("/")
	public String index(){
		return inicio();
	}
	
	@RequestMapping("/inicio/")
	public String inicio() {
		return "inicio/inicio";
	}
	
	@RequestMapping("/acerca/")
	public String about(){
		return "inicio/acerca";
	}
}
