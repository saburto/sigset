package cl.sigti.sigset.servicios.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.repositorios.admin.EmpresaRepositorio;

@Service
public class EmpresasServicioImpl implements EmpresasServicio {
	
	@Autowired
	private EmpresaRepositorio empresaRepositorio;
	
	/* (non-Javadoc)
	 * @see cl.sigti.sigset.servicios.admin.EmpresasServicio#getEmpresas()
	 */
	public List<Empresa> getEmpresas(){
		return empresaRepositorio.getAll();
	}

	@Override
	public void crearNuevaEmpresa(Empresa empresa) {
		empresaRepositorio.Create(empresa);
	}
}
