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
public class TipoDireccion implements Serializable {
	public TipoDireccion() {
	}
	
	private java.math.BigDecimal idTipoDireccion;
	
	private String descripcion;
	
	private java.util.Set<cl.sigti.sigset.modelo.Direccion> Direccion = new java.util.HashSet<cl.sigti.sigset.modelo.Direccion>();
	
	public void setIdTipoDireccion(java.math.BigDecimal value) {
		this.idTipoDireccion = value;
	}
	
	public java.math.BigDecimal getIdTipoDireccion() {
		return idTipoDireccion;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdTipoDireccion();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDireccion(java.util.Set<cl.sigti.sigset.modelo.Direccion> value) {
		this.Direccion = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Direccion> getDireccion() {
		return Direccion;
	}
	
	
	public String toString() {
		return String.valueOf(getIdTipoDireccion());
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
