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
public class TipoOrden implements Serializable {
	public TipoOrden() {
	}
	
	private java.math.BigDecimal idTipoOrden;
	
	private String descripcion;
	
	private java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> OrdenTrabajo = new java.util.HashSet<cl.sigti.sigset.modelo.OrdenTrabajo>();
	
	public void setIdTipoOrden(java.math.BigDecimal value) {
		this.idTipoOrden = value;
	}
	
	public java.math.BigDecimal getIdTipoOrden() {
		return idTipoOrden;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdTipoOrden();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setOrdenTrabajo(java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> value) {
		this.OrdenTrabajo = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> getOrdenTrabajo() {
		return OrdenTrabajo;
	}
	
	
	public String toString() {
		return String.valueOf(getIdTipoOrden());
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
