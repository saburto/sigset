package cl.sigti.sigset.controllers;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cl.sigti.sigset.modelo.Region;
import cl.sigti.sigset.util.JsonAutoComplete;

@Controller
@RequestMapping("/util")
public class UtilController {
	
	@RequestMapping("/encontrarRegiones")
	@ResponseBody()
	public String getRegiones( @RequestParam String q) throws IOException{

		List<Region> regiones = new ArrayList<Region>();
		Region r=new Region();
		r.setNombre("metro");
		r.setId(new BigDecimal(1));
		Region r2=new Region();
		r2.setNombre("arica");
		r2.setId(new BigDecimal(2));
		
		regiones.add(r);
		regiones.add(r2);

		return JsonAutoComplete.ToJson(regiones, "id", "nombre");
	}
}
