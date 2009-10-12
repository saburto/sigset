package test.repositorio;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import cl.sigti.sigset.modelo.Comuna;
import cl.sigti.sigset.modelo.Provincia;
import cl.sigti.sigset.modelo.Region;
import cl.sigti.sigset.repositorios.direccion.UtilDireccionRepositorio;
import cl.sigti.sigset.repositorios.direccion.UtilDireccionRepositorioImpl;

public class Test_DireccionUtilRepository {

	UtilDireccionRepositorio repo;
	
	@Before
	public void setUp() throws Exception {
		repo = new UtilDireccionRepositorioImpl();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetRegionesPorNombre() {
		
		List<Region> lista = repo.getRegionesPorNombre("Metro");
		assertNotNull(lista);
		assertTrue(lista.size() > 0);
	}

	@Test
	public void testGetProvinciasByRegion() {
		List<Provincia> lista = repo.getProvinciasByRegion(1, "");
		assertNotNull(lista);
		assertTrue(lista.size() > 0);
	}

	@Test
	public void testGetComunasByProvincia() {
		List<Comuna> lista = repo.getComunasByProvincia(1,"");
		assertNotNull(lista);
		assertTrue(lista.size() > 0);
		
	}

}
