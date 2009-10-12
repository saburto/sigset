package cl.sigti.sigset.servicios.empresa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.repositorios.empresa.EmpresaRepositorio;

@Service
public class EmpresaServicioImpl implements EmpresaServicio 
{

	@Autowired
	EmpresaRepositorio repo;
	
	public void crearEmpresa(Empresa empresa)
	{
		//empresa.getDireccion().setId(id)
		
		repo.Create(empresa);
		
	}
}

