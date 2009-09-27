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
public class Estado implements Serializable {
	public Estado() {
	}
	
	private java.math.BigDecimal idEstado;
	
	private String descripcion;
	
	private java.util.Set<cl.sigti.sigset.modelo.Detalle> Detalle = new java.util.HashSet<cl.sigti.sigset.modelo.Detalle>();
	
	public void setIdEstado(java.math.BigDecimal value) {
		this.idEstado = value;
	}
	
	public java.math.BigDecimal getIdEstado() {
		return idEstado;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdEstado();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDetalle(java.util.Set<cl.sigti.sigset.modelo.Detalle> value) {
		this.Detalle = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Detalle> getDetalle() {
		return Detalle;
	}
	
	
	public String toString() {
		return String.valueOf(getIdEstado());
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
