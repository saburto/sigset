package cl.sigti.sigset.servicios.empresa;

import java.util.List;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.repositorios.empresa.EmpresaRepositorio;
import cl.sigti.sigset.repositorios.empresa.EmpresaRepositorioImpl;

public class EmpresaServicioImpl 
{

	EmpresaRepositorio repo = new EmpresaRepositorioImpl();
	
		public List<Empresa> getAll()
		{
			// TODO Auto-generated method stub
			return null;
		}
		
		public Empresa Update(Empresa obj) {
			// TODO Auto-generated method stub
			return null;
		}
		
		public boolean Delete(Empresa obj) {
			// TODO Auto-generated method stub
			return false;
		}
		
		public Empresa Create(Empresa obj) {
			// TODO Auto-generated method stub
			return null;
		}
}

