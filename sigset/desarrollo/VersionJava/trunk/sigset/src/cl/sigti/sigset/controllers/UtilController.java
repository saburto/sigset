package cl.sigti.sigset.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cl.sigti.sigset.modelo.Comuna;
import cl.sigti.sigset.modelo.Provincia;
import cl.sigti.sigset.modelo.Region;
import cl.sigti.sigset.repositorios.direccion.UtilDireccionRepositorio;
import cl.sigti.sigset.util.JsonAutoComplete;

@Controller
@RequestMapping("/util")
public class UtilController {
	
	@Autowired
	UtilDireccionRepositorio utilDireccionRepositorio;
	
	@RequestMapping("/encontrarRegiones")
	@ResponseBody()
	public String getRegiones( @RequestParam String q) {

		List<Region> regiones = utilDireccionRepositorio.getRegionesPorNombre(q);
		return JsonAutoComplete.ToJson(regiones, "id", "nombre");
	}
	
	@RequestMapping("/encontrarProvincias")
	@ResponseBody()
	public String getProvincia( @RequestParam String q, @RequestParam int Region) {

		List<Provincia> provincias = utilDireccionRepositorio.getProvinciasByRegion(Region,q);
		return JsonAutoComplete.ToJson(provincias, "id", "nombre");
	}
	
	@RequestMapping("/encontrarComunas")
	@ResponseBody()
	public String getComunas(@RequestParam String q, @RequestParam int Provincia) {

		List<Comuna> comunas = utilDireccionRepositorio.getComunasByProvincia(Provincia, q);
		return JsonAutoComplete.ToJson(comunas, "id", "nombre");
	}


}
