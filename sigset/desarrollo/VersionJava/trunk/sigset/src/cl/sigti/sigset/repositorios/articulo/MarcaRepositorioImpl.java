package cl.sigti.sigset.repositorios.articulo;

import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Logger;

import cl.sigti.sigset.modelo.Marca;
import cl.sigti.sigset.repositorios.RepositorioBaseImpl;

public class MarcaRepositorioImpl extends RepositorioBaseImpl<Marca> {

	private static final Logger log = Logger.getLogger(MarcaRepositorioImpl.class.getName());
	public MarcaRepositorioImpl() {
		super(Marca.class);
	}
	
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
    
    public Marca CrearMarca(String marca)
    {
    	marca = marca.trim();
    	Marca nuevaMarca = new Marca();
    	nuevaMarca.setDescripcion(marca);
    	nuevaMarca.setIdMarca(new Long(getCountMarcas()+1));
    	this.Create(nuevaMarca);
    	return nuevaMarca;
    }
    
    public int getCountMarcas(){
    	return this.getAll().size();
    }


}
