package cl.sigti.sigset.repositorios.articulo;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.stereotype.Repository;

import cl.sigti.sigset.modelo.Linea;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

@Repository
public class LineaRepositorioImpl extends RepositorioBaseImpl<Linea> implements LineaRepositorio {
	
	private static final Logger log = Logger.getLogger(LineaRepositorioImpl.class.getName());
	public LineaRepositorioImpl() {
		super(Linea.class);
	}
	
    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.articulo.LineaRepositorio#getLineas(java.lang.String)
	 */
    @SuppressWarnings("unchecked")
	public List<Linea> getLineas(String nombre)
    {
		List<Linea> lista = null;
		try{
		    String query = "select from "+ Linea.class.getName() +" where descripcion.startsWith(lineaNombre) parameters String lineaNombre";
		    lista = (List<Linea>) pm.newQuery(query).execute(nombre);
		    lista.size();
		}
		catch(Exception ex){
			log.severe(ex.getMessage());
		}
	    return lista;
    }
    
    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.articulo.LineaRepositorio#getMarcaPorNombre(java.lang.String)
	 */
    @SuppressWarnings("unchecked")
	public Linea getMarcaPorNombre(String lineaNombre)
    {
        lineaNombre = lineaNombre.trim();
        Linea linea = null;
		try{
		    String query = "select from "+ Linea.class.getName() +" where descripcion == lineaNombre parameters String lineaNombre";
		    List<Linea> lista = (List<Linea>) pm.newQuery(query).execute(lineaNombre);
		    lista.size();
		    linea = lista.get(0);
		}
		catch(Exception ex){
			log.severe(ex.getMessage());
		}
	    return linea;
    }
    
    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.articulo.LineaRepositorio#crearMarca(java.lang.String)
	 */
    public Linea crearMarca(String linea)
    {
    	linea = linea.trim();
    	Linea nuevaLinea = new Linea();
    	nuevaLinea.setDescripcion(linea);
    	nuevaLinea.setIdLinea(new Long(this.Count()+1));
    	this.Create(nuevaLinea);
    	return nuevaLinea;
    }

}
