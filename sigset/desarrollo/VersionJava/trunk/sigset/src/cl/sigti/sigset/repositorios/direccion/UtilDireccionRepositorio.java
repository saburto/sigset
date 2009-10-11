package cl.sigti.sigset.repositorios.direccion;

import java.util.List;

import cl.sigti.sigset.modelo.Comuna;
import cl.sigti.sigset.modelo.Provincia;
import cl.sigti.sigset.modelo.Region;

public interface UtilDireccionRepositorio {

	public abstract List<Region> getRegionesPorNombre(String regionNombre);

	public abstract List<Provincia> getProvinciasByRegion(int regionId,
			String nombreAlcance);

	public abstract List<Comuna> getComunasByProvincia(int idProvincia,
			String nombreAlcance);

}