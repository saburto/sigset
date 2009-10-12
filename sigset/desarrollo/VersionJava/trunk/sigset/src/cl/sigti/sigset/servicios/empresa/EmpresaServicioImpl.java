package cl.sigti.sigset.servicios.empresa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.repositorios.empresa.EmpresaRepositorio;
import cl.sigti.sigset.repositorios.usuario.UsuarioRepositorio;

@Service
public class EmpresaServicioImpl implements EmpresaServicio 
{

	@Autowired
	EmpresaRepositorio empresaRepo;
	
	@Autowired
	UsuarioRepositorio usuarioRepo;
	
	public void crearEmpresa(Empresa empresa)
	{
		//empresa.getDireccion().setId(id)
		
		empresaRepo.Create(empresa);
		
	}
}

