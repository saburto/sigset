package cl.sigti.sigset.servicios.empresa;

import java.util.List;

import cl.sigti.sigset.modelo.Empresa;


public interface EmpresaServicio {

	public void crearEmpresa(Empresa empresa);
	public List<Empresa> listarEmpresas();

}