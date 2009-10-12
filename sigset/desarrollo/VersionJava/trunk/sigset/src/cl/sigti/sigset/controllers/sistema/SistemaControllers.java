package cl.sigti.sigset.controllers.sistema;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cl.sigti.sigset.modelo.Direccion;
import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.servicios.admin.EmpresasServicio;
import cl.sigti.sigset.servicios.admin.UsuarioServicio;

@Controller()
@RequestMapping("/sistema")
public class SistemaControllers{

	private final String SISTEMA = "sitema/";
	
	@Autowired
	UsuarioServicio usuarioServicio;
	
	@Autowired
	EmpresasServicio empresasServicio;
	

	@RequestMapping("/")
	public ModelAndView inicio() {
												//    admin/inicio
		ModelAndView modelAndView = new ModelAndView( SISTEMA + "inicio");
		
		modelAndView.addObject("usuarios", usuarioServicio.getUsuarios());
		modelAndView.addObject("usuario", new Usuario());
		
		
		return modelAndView;
	}

	@RequestMapping("/menu/")
	public ModelAndView menu(){
		//TODO: llamar a servico de autorizacion y cargar permisos a los menus.
		ModelAndView modelAndView = new ModelAndView("sistema/menu");
		return modelAndView;
	}	
	
	@RequestMapping(value = "/crear/", method = RequestMethod.POST)
	public String crear(@ModelAttribute Usuario usuario) {
		
		
		usuarioServicio.crearNuevoUsuario(usuario);
		return "redirect:/admin/";
	}

	@RequestMapping("/empresa/")
	public ModelAndView inicioEmpresa(){
		ModelAndView modelAndView = new ModelAndView(SISTEMA + "empresa");
		modelAndView.addObject("empresas",empresasServicio.getEmpresas());
		Empresa empresa = new Empresa();
		empresa.setDireccion(new Direccion());
		modelAndView.addObject("empresa", empresa);
		return modelAndView;
	}
	
	@RequestMapping(value = "/empresa/crear/", method = RequestMethod.POST ) 
	public String crearEmpresa(@ModelAttribute Empresa empresa){
		empresasServicio.crearNuevaEmpresa(empresa);
		return "redirect:/admin/empresa/";
	}
	
	@RequestMapping("/empresa/crear/")
	public String crear()
	   {
		return "sistema/empresa/crear";
		}
	
	@RequestMapping("/perfil/crear/")
	public String crearPerfil()
	{
		return "sistema/perfil/crear";
		
	}
	
	@RequestMapping("/usuario/crear/")
	public String crearUsuario()
	{
		return "sistema/usuario/crear";		
	}
}
