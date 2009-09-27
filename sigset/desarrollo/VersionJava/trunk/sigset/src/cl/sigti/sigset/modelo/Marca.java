/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: Anonymous
 * License Type: Purchased
 */
package cl.sigti.sigset.modelo;

import java.io.Serializable;
public class Marca implements Serializable {
	public Marca() {
	}
	
	private java.math.BigDecimal idMarca;
	
	private String descripcion;
	
	private java.util.Set<cl.sigti.sigset.modelo.Articulo> Articulo = new java.util.HashSet<cl.sigti.sigset.modelo.Articulo>();
	
	public void setIdMarca(java.math.BigDecimal value) {
		this.idMarca = value;
	}
	
	public java.math.BigDecimal getIdMarca() {
		return idMarca;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdMarca();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setArticulo(java.util.Set<cl.sigti.sigset.modelo.Articulo> value) {
		this.Articulo = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Articulo> getArticulo() {
		return Articulo;
	}
	
	
	public String toString() {
		return String.valueOf(getIdMarca());
	}
	
	private boolean _saved = false;
	
	public void onSave() {
		_saved=true;
	}
	
	
	public void onLoad() {
		_saved=true;
	}
	
	
	public boolean isSaved() {
		return _saved;
	}
	
	
}
