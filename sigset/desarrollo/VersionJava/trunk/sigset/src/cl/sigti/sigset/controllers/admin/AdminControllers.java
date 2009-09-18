package cl.sigti.sigset.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
@RequestMapping("/admin")
public class AdminControllers {
	
	@RequestMapping("/")
	public String inicio(){
		
		return "admin/inicio";
	}
}
