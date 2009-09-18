package cl.sigti.sigset.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AutenticacionController {
	
	@RequestMapping("/login/")
	public String login(){
		return "login/login";
	}
	
	@RequestMapping("/login/iniciar/")
	public String inciar(Model model){
		return "";
	}
}
