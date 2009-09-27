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
public class Detalle implements Serializable {
	public Detalle() {
	}
	
	private java.math.BigDecimal id;
	
	private cl.sigti.sigset.modelo.OrdenTrabajo IdOrden;
	
	private java.sql.Timestamp fechaCreacion;
	
	private String detalle;
	
	private cl.sigti.sigset.modelo.Estado Estado;
	
	private void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	
	public java.math.BigDecimal getId() {
		return id;
	}
	
	public java.math.BigDecimal getORMID() {
		return getId();
	}
	
	public void setFechaCreacion(java.sql.Timestamp value) {
		this.fechaCreacion = value;
	}
	
	public java.sql.Timestamp getFechaCreacion() {
		return fechaCreacion;
	}
	
	public void setDetalle(String value) {
		this.detalle = value;
	}
	
	public String getDetalle() {
		return detalle;
	}
	
	public void setIdOrden(cl.sigti.sigset.modelo.OrdenTrabajo value) {
		this.IdOrden = value;
	}
	
	public cl.sigti.sigset.modelo.OrdenTrabajo getIdOrden() {
		return IdOrden;
	}
	
	public void setEstado(cl.sigti.sigset.modelo.Estado value) {
		this.Estado = value;
	}
	
	public cl.sigti.sigset.modelo.Estado getEstado() {
		return Estado;
	}
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
