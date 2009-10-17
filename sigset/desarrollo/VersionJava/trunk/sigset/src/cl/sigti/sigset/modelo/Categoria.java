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

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Categoria implements Serializable {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key idCategoria;
	
	@Persistent
	private String descripcion;
	
	@Persistent
	private cl.sigti.sigset.modelo.Empresa IdEmpresa;
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.Articulo> Articulo = new java.util.HashSet<cl.sigti.sigset.modelo.Articulo>();
	
	public void setIdCategoria(Key value) {
		this.idCategoria = value;
	}
	
	public Key getIdCategoria() {
		return idCategoria;
	}
	
	public Key getORMID() {
		return getIdCategoria();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setIdEmpresa(cl.sigti.sigset.modelo.Empresa value) {
		this.IdEmpresa = value;
	}
	
	public cl.sigti.sigset.modelo.Empresa getIdEmpresa() {
		return IdEmpresa;
	}
	
	public void setArticulo(java.util.Set<cl.sigti.sigset.modelo.Articulo> value) {
		this.Articulo = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Articulo> getArticulo() {
		return Articulo;
	}
	
	
	public String toString() {
		return String.valueOf(getIdCategoria());
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
