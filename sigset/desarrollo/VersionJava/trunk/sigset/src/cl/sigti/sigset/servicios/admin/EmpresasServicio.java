package cl.sigti.sigset.servicios.admin;

import java.util.List;

import cl.sigti.sigset.modelo.Empresa;

public interface EmpresasServicio {

	public abstract List<Empresa> getEmpresas();

	public abstract void crearNuevaEmpresa(Empresa empresa);

}