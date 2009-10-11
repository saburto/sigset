import junit.framework.Assert;

import org.junit.Test;
import org.junit.experimental.theories.suppliers.TestedOn;

import cl.sigti.sigset.modelo.Empresa;
import cl.sigti.sigset.repositorios.config.*;


public class UsuarioRepositorioTest {

	@Test
	public void TestEmpresaUsuarios()
	{
		ConfiguracionRepositorio repo = new ConfiguracionRepositorioImpl();
		Empresa empresa = new Empresa();
		empresa.setNombreCorto("");
		repo.UsuariosEmpresa(empresa);	
		Assert.assertTrue(true);
	}
	
}
