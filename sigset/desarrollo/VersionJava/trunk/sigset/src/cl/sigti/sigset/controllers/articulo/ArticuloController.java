package cl.sigti.sigset.controllers.articulo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cl.sigti.sigset.repositorios.articulo.LineaRepositorio;
import cl.sigti.sigset.repositorios.articulo.MarcaRepositorio;
import cl.sigti.sigset.util.JsonAutoComplete;

@Controller
@RequestMapping("/articulo")
public class ArticuloController {

	@Autowired
	MarcaRepositorio marcaRepositorio;
	
	@Autowired
	LineaRepositorio lineaRepositorio;
	
	@ResponseBody
	@RequestMapping("/marcas/")
	public String getMarcas(@RequestParam String q){
		return JsonAutoComplete.ToJson(marcaRepositorio.getMarcas(q), "idMarca", "descripcion");
	}
	
	@ResponseBody
	@RequestMapping("/lineas/")
	public String getLineas(@RequestParam String q){
		return JsonAutoComplete.ToJson(lineaRepositorio.getLineas(q) , "idLinea", "descripcion");
	}
	
	
}
