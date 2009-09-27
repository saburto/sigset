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
public class Porcentaje implements Serializable {
	public Porcentaje() {
	}
	
	private java.math.BigDecimal id;
	
	private cl.sigti.sigset.modelo.PrecioGarantia IdPrecio;
	
	private java.math.BigDecimal porcentaje;
	
	private void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	
	public java.math.BigDecimal getId() {
		return id;
	}
	
	public java.math.BigDecimal getORMID() {
		return getId();
	}
	
	public void setPorcentaje(java.math.BigDecimal value) {
		this.porcentaje = value;
	}
	
	public java.math.BigDecimal getPorcentaje() {
		return porcentaje;
	}
	
	public void setIdPrecio(cl.sigti.sigset.modelo.PrecioGarantia value) {
		this.IdPrecio = value;
	}
	
	public cl.sigti.sigset.modelo.PrecioGarantia getIdPrecio() {
		return IdPrecio;
	}
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
