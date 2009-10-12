package test.repositorio;

import static org.junit.Assert.*;

import java.io.File;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import test.TestEnvironment;

import com.google.appengine.api.datastore.dev.LocalDatastoreService;

import com.google.appengine.tools.development.ApiProxyLocalImpl;
import com.google.apphosting.api.ApiProxy;

import cl.sigti.sigset.modelo.Marca;
import cl.sigti.sigset.repositorios.articulo.MarcaRepositorio;
import cl.sigti.sigset.repositorios.articulo.MarcaRepositorioImpl;

public class Test_MarcaRepositorio {

	MarcaRepositorio repo;
	
	@Before
	public void setUp() throws Exception {
		ApiProxy.setEnvironmentForCurrentThread(new TestEnvironment());
        ApiProxy.setDelegate(new ApiProxyLocalImpl(new File(".")){});
        
        ApiProxyLocalImpl proxy = (ApiProxyLocalImpl) ApiProxy.getDelegate();
        proxy.setProperty(LocalDatastoreService.NO_STORAGE_PROPERTY, Boolean.TRUE.toString());

        
		repo = new MarcaRepositorioImpl();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetMarcas() {
		List<Marca> marcas = repo.getMarcas("so");
		assertNotNull(marcas);
		assertEquals(0, marcas.size());
	}

	@Test
	public void testGetMarcaPorNombre() {
		Marca marca = repo.getMarcaPorNombre("Sony");
		assertNull(marca);
	}

	@Test
	public void testCrearMarca() {
		
		Marca marca = repo.crearMarca("Sony");
		assertNotNull(marca);
		assertEquals("Sony", marca.getDescripcion());
	}

}
