package cl.sigti.sigset.controllers.sistema;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cl.sigti.sigset.modelo.Direccion;
import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Perfil;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.servicios.empresa.EmpresaServicio;

@Controller()
@RequestMapping("/sistema")
public class SistemaControllers {

	@Autowired
	EmpresaServicio empresasServicio;

	@RequestMapping("/")
	public String inicio() {
		return crear(); 									
	}

	@RequestMapping("/menu/")
	public ModelAndView menu() {
		// TODO: llamar a servico de autorizacion y cargar permisos a los menus.
		ModelAndView modelAndView = new ModelAndView("sistema/menu");
		return modelAndView;
	}

	@RequestMapping(value = "/empresa/crear/", method = RequestMethod.POST)
	public String crearEmpresa(@ModelAttribute Empresa empresa,
			@ModelAttribute Direccion direccion,
			@ModelAttribute Usuario usuario, @RequestParam String rutUsuario,
			@RequestParam String rutEmpresa, @RequestParam String perfilTipo) 
	
	{
		
		Perfil perfil = new Perfil();
		perfil.setDescripcion(perfilTipo);
		empresa.setDireccion(direccion);
		empresa.setUsuarioEncargado(usuario);
		rutEmpresa = rutEmpresa.replace(".", "");
		rutEmpresa = rutEmpresa.split("-")[0];
		rutUsuario = rutUsuario.replace(".", "");
		rutUsuario = rutUsuario.split("-")[0];
		empresa.setRut(Integer.parseInt(rutEmpresa));	    
		usuario.setRut(Integer.parseInt(rutUsuario));		
		empresa.setUsuarioEncargado(usuario);
	    empresasServicio.crearEmpresa(empresa);
		return "redirect:/admin/empresa/";
	}

	@RequestMapping("/empresa/crear/")
	public String crear() {
		return "sistema/empresa/crear";
	}

	@RequestMapping("/perfil/crear/")
	public String crearPerfil() {
		return "sistema/perfil/crear";

	}

	@RequestMapping("/usuario/crear/")
	public String crearUsuario() {
		return "sistema/usuario/crear";
	}
}
