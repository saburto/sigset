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
public class Especialidades implements Serializable {
	public Especialidades() {
	}
	
	private java.math.BigDecimal id;
	
	private cl.sigti.sigset.modelo.Tecnicos IdTecnico;
	
	private cl.sigti.sigset.modelo.TipoEspecialidad TipoEspecialidad;
	
	private void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	
	public java.math.BigDecimal getId() {
		return id;
	}
	
	public java.math.BigDecimal getORMID() {
		return getId();
	}
	
	public void setIdTecnico(cl.sigti.sigset.modelo.Tecnicos value) {
		this.IdTecnico = value;
	}
	
	public cl.sigti.sigset.modelo.Tecnicos getIdTecnico() {
		return IdTecnico;
	}
	
	public void setTipoEspecialidad(cl.sigti.sigset.modelo.TipoEspecialidad value) {
		this.TipoEspecialidad = value;
	}
	
	public cl.sigti.sigset.modelo.TipoEspecialidad getTipoEspecialidad() {
		return TipoEspecialidad;
	}
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
