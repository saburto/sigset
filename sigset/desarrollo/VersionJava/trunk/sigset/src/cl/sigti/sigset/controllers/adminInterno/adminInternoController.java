package cl.sigti.sigset.controllers.adminInterno;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.servicios.admin.EmpresasServicio;
import cl.sigti.sigset.servicios.admin.UsuarioServicio;

@RequestMapping("/adminInterno")
@Controller
public class adminInternoController {
   
	@RequestMapping("/index/")
	public String index()
	{
		return "adminInterno/index";
	}
	

	@RequestMapping("/crear/usuario/")
	public String crear()
	{
		return "adminInterno/crear";	
		
	}
	@RequestMapping("/crear/usuario/empresa/")
	public String crear(@ModelAttribute Usuario usuario)
	{
		return "adminInterno/crear";	
		
	}
	
	
	
	
}
