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
public class TipoArticulo implements Serializable {
	public TipoArticulo() {
	}
	
	private java.math.BigDecimal idTipoArticulo;
	
	private String descripcion;
	
	private cl.sigti.sigset.modelo.Empresa IdEmpresa;
	
	private java.util.Set<cl.sigti.sigset.modelo.Articulo> Articulo = new java.util.HashSet<cl.sigti.sigset.modelo.Articulo>();
	
	public void setIdTipoArticulo(java.math.BigDecimal value) {
		this.idTipoArticulo = value;
	}
	
	public java.math.BigDecimal getIdTipoArticulo() {
		return idTipoArticulo;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdTipoArticulo();
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
		return String.valueOf(getIdTipoArticulo());
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
