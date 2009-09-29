package cl.sigti.sigset.controllers.admin;


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

@Controller()
@RequestMapping("/admin")
public class AdminControllers{

	private final String ADMIN = "admin/";
	
	@Autowired
	UsuarioServicio usuarioServicio;
	
	@Autowired
	EmpresasServicio empresasServicio;
	

	@RequestMapping("/")
	public ModelAndView inicio() {
												//    admin/inicio
		ModelAndView modelAndView = new ModelAndView( ADMIN + "inicio");
		
		
		modelAndView.addObject("usuarios", usuarioServicio.getUsuarios());
		modelAndView.addObject("usuario", new Usuario());
		
		
		return modelAndView;
	}

	@RequestMapping(value = "/crear/", method = RequestMethod.POST)
	public String crear(@ModelAttribute Usuario usuario) {
		
		
		usuarioServicio.crearNuevoUsuario(usuario);
		return "redirect:/admin/";
	}

	@RequestMapping("/empresa/")
	public ModelAndView inicioEmpresa(){
		ModelAndView modelAndView = new ModelAndView(ADMIN + "empresa");
		modelAndView.addObject("empresas",empresasServicio.getEmpresas());
		modelAndView.addObject("empresa", new Empresa());
		return modelAndView;
	}
	
	@RequestMapping("/empresa/crear/")
	public String crearEmpresa(@ModelAttribute Empresa empresa){
		empresasServicio.crearNuevaEmpresa(empresa);
		return "redirect:/admin/empresa/";
	}
}
