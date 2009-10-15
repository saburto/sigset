package cl.sigti.sigset.controllers.sistema;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cl.sigti.sigset.modelo.Direccion;
import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.modelo.Perfil;
import cl.sigti.sigset.modelo.Usuario;
import cl.sigti.sigset.servicios.empresa.EmpresaServicio;
import cl.sigti.sigset.servicios.usuario.UsuarioServicio;

@Controller
@RequestMapping("/empresa")
public class EmpresaController {
	
	@Autowired
	EmpresaServicio empresasServicio;
	
	@Autowired
	UsuarioServicio usuarioServicio;
	

	@RequestMapping(value = "/crear/", method = RequestMethod.POST)
	public String crearEmpresa(@ModelAttribute Empresa empresa,
			@ModelAttribute Direccion direccion,
			@ModelAttribute Usuario usuario, @RequestParam String rutUsuario,
			@RequestParam String rutEmpresa, @RequestParam String perfilTipo) 
	
	{
		
		Perfil perfil = new Perfil();
		perfil.setDescripcion(perfilTipo);
		empresa.setDireccion(direccion);
	//	empresa.setUsuarioEncargado(usuario);
		rutEmpresa = rutEmpresa.replace(".", "");
		rutEmpresa = rutEmpresa.split("-")[0];
		rutUsuario = rutUsuario.replace(".", "");
		rutUsuario = rutUsuario.split("-")[0];
		empresa.setRut(Integer.parseInt(rutEmpresa));	    
		usuario.setRut(Integer.parseInt(rutUsuario));		
	//	empresa.setUsuarioEncargado(usuario);
		usuarioServicio.crearUsuario(usuario);
	    empresasServicio.crearEmpresa(empresa);	    	
		return "redirect:sistema/empresa/crear/";
	}

	
	@RequestMapping("/crear/")
	public String crear() {
		return "sistema/empresa/crear";
	}

	@RequestMapping("/listar/")
	public String listar(Model model) {
		model.addAttribute("empresas", empresasServicio.listarEmpresas());
		return "sistema/empresa/listar" ;
	}

}
