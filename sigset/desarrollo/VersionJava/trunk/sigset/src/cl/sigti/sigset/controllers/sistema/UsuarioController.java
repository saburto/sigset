package cl.sigti.sigset.controllers.sistema;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cl.sigti.sigset.servicios.usuario.UsuarioServicio;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	UsuarioServicio usuarioServicio;
	
	@RequestMapping("/crear/")
	public String crearUsuario() {
		return "sistema/usuario/crear";
	}
	
	
	
}
