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
public class TipoContacto implements Serializable {
	public TipoContacto() {
	}
	
	private java.math.BigDecimal idTipoContacto;
	
	private String descripcion;
	
	private java.util.Set<cl.sigti.sigset.modelo.Contacto> Contacto = new java.util.HashSet<cl.sigti.sigset.modelo.Contacto>();
	
	public void setIdTipoContacto(java.math.BigDecimal value) {
		this.idTipoContacto = value;
	}
	
	public java.math.BigDecimal getIdTipoContacto() {
		return idTipoContacto;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdTipoContacto();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setContacto(java.util.Set<cl.sigti.sigset.modelo.Contacto> value) {
		this.Contacto = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Contacto> getContacto() {
		return Contacto;
	}
	
	
	public String toString() {
		return String.valueOf(getIdTipoContacto());
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
