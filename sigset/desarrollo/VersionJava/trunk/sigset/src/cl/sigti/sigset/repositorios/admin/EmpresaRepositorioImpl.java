package cl.sigti.sigset.repositorios.admin;

import org.springframework.stereotype.Repository;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class EmpresaRepositorioImpl extends RepositorioBaseImpl<Empresa> implements EmpresaRepositorio {

	public EmpresaRepositorioImpl() {
		super(Empresa.class);

	}


}
