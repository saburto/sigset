package cl.sigti.sigset.controllers.ordenTrabajo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.DataBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cl.sigti.sigset.modelo.Cliente;
import cl.sigti.sigset.modelo.ClienteComercial;
import cl.sigti.sigset.modelo.ClienteParticular;
import cl.sigti.sigset.modelo.Direccion;
import cl.sigti.sigset.modelo.OrdenTrabajo;
import cl.sigti.sigset.util.json.FormResult;
import cl.sigti.sigset.validacion.DireccionValidacion;

@RequestMapping("/orden")
@Controller
public class OrdenTrabajoController {
	
	
	@RequestMapping("/menu/")
	public ModelAndView menu(){
		//TODO: llamar a servico de autorizacion y cargar permisos a los menus.
		ModelAndView modelAndView = new ModelAndView("orden/menu");
		return modelAndView;
	}
	
	@RequestMapping("/")
	public String inicio(Model model){
		return crear(model);
	}

	@RequestMapping("/crear/")
	public String crear(Model model){

		model.addAttribute("cliente", new Cliente());
		return "orden/crear";
	}
	
	@ResponseBody
	@RequestMapping(value="/crear/", method= RequestMethod.POST)
	public String crearSubmit(	@ModelAttribute ClienteComercial clienteComercial,
								@ModelAttribute ClienteParticular clienteParticular,
								@ModelAttribute Direccion direccion,
								@ModelAttribute OrdenTrabajo orden,
								@RequestParam(value="contactoEmail") String contactoEmail,
								@RequestParam(value="contactoTelefono") String contactoTelefono,
								@RequestParam(value="tipoCliente") String tipoCliente,
								@RequestParam(value="observacion") String observacion,
								@RequestParam(value="rutCliente") String rutCliente,
								@RequestParam(value="idTipoOrden") String idTipoOrden,
								Model model
								){
		FormResult formResult = new FormResult();
		DataBinder binder = new DataBinder(direccion);
		binder.setValidator(new DireccionValidacion());
		binder.validate();
		
		if(binder.getBindingResult().hasErrors()){
			
			formResult.setMensajeError("La creación de orden de trabajo causo los siguientes problemas");
			formResult.setErrores(binder.getBindingResult().getAllErrors());
			return formResult.ToJson();
		}
		formResult.setUrl("/orden/orden/");
		return formResult.ToJson();
		
//		
//		return "orden/orden";
	}
	
	@RequestMapping("/orden/")
	public String ordenSucces(){
		return "orden/orden";
	}
	
	
	
	
	
}
