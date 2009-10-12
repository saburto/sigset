package cl.sigti.sigset.repositorios.articulo;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.stereotype.Repository;

import cl.sigti.sigset.modelo.Marca;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class MarcaRepositorioImpl extends RepositorioBaseImpl<Marca> implements MarcaRepositorio {

	private static final Logger log = Logger.getLogger(MarcaRepositorioImpl.class.getName());
	public MarcaRepositorioImpl() {
		super(Marca.class);
	}
	
    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.articulo.MarcaRepositorio#getMarcas(java.lang.String)
	 */
    @SuppressWarnings("unchecked")
	public List<Marca> getMarcas(String nombre)
    {
		List<Marca> lista = null;
		try{
		    String query = "select from "+ Marca.class.getName() +" where descripcion.startsWith(marcaNombre) parameters String marcaNombre";
		    lista = (List<Marca>) pm.newQuery(query).execute(nombre);
		    lista.size();
		}
		catch(Exception ex){
			log.severe(ex.getMessage());
		}
	    return lista;
    }
    
    
    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.articulo.MarcaRepositorio#getMarcaPorNombre(java.lang.String)
	 */
    @SuppressWarnings("unchecked")
	public Marca getMarcaPorNombre(String marcaNombre)
    {
        marcaNombre = marcaNombre.trim();
        Marca marca = null;
		try{
		    String query = "select from "+ Marca.class.getName() +" where descripcion == marcaNombre parameters String marcaNombre";
		    List<Marca> lista = (List<Marca>) pm.newQuery(query).execute(marcaNombre);
		    lista.size();
		    marca = lista.get(0);
		}
		catch(Exception ex){
			log.severe(ex.getMessage());
		}
	    return marca;
    }
    
    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.articulo.MarcaRepositorio#CrearMarca(java.lang.String)
	 */
    public Marca crearMarca(String marca)
    {
    	marca = marca.trim();
    	Marca nuevaMarca = new Marca();
    	nuevaMarca.setDescripcion(marca);
    	nuevaMarca.setIdMarca(new Long(this.Count()+1));
    	this.Create(nuevaMarca);
    	return nuevaMarca;
    }


}
