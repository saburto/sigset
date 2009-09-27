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
public class Region implements Serializable {
	public Region() {
	}
	
	private java.math.BigDecimal id;
	
	private String nombre;
	
	private java.util.Set<cl.sigti.sigset.modelo.Provincia> Provincia = new java.util.HashSet<cl.sigti.sigset.modelo.Provincia>();
	
	private java.util.Set<cl.sigti.sigset.modelo.Direccion> Direccion = new java.util.HashSet<cl.sigti.sigset.modelo.Direccion>();
	
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	
	public java.math.BigDecimal getId() {
		return id;
	}
	
	public java.math.BigDecimal getORMID() {
		return getId();
	}
	
	public void setNombre(String value) {
		this.nombre = value;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setProvincia(java.util.Set<cl.sigti.sigset.modelo.Provincia> value) {
		this.Provincia = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Provincia> getProvincia() {
		return Provincia;
	}
	
	
	public void setDireccion(java.util.Set<cl.sigti.sigset.modelo.Direccion> value) {
		this.Direccion = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Direccion> getDireccion() {
		return Direccion;
	}
	
	
	public String toString() {
		return String.valueOf(getId());
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
