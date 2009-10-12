package cl.sigti.sigset.controllers.sistema;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/perfil")
public class PerfilController {

	
	
	@RequestMapping("/crear/")
	public String crearPerfil() {
		return "sistema/perfil/crear";

	}
}
