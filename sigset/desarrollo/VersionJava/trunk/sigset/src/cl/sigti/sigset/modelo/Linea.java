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

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.PrimaryKey;
import javax.jdo.annotations.Persistent;
@SuppressWarnings("serial")
@PersistenceCapable
public class Linea implements Serializable {
	public Linea() {
	}
	
	@Persistent
	@PrimaryKey
	private Long idLinea;
	
	@Persistent
	private String descripcion;
	
	private java.util.Set<cl.sigti.sigset.modelo.Articulo> Articulo = new java.util.HashSet<cl.sigti.sigset.modelo.Articulo>();
	
	public void setIdLinea(Long value) {
		this.idLinea = value;
	}
	
	public Long getIdLinea() {
		return idLinea;
	}
	
	public Long getORMID() {
		return getIdLinea();
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
		return String.valueOf(getIdLinea());
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
