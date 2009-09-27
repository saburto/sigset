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
public class HistorialModificacionOrden implements Serializable {
	public HistorialModificacionOrden() {
	}
	
	private java.math.BigDecimal id;
	
	private cl.sigti.sigset.modelo.OrdenTrabajo IdOrden;
	
	private java.math.BigDecimal usuario;
	
	private java.sql.Timestamp fecha;
	
	private String detalle;
	
	private void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	
	public java.math.BigDecimal getId() {
		return id;
	}
	
	public java.math.BigDecimal getORMID() {
		return getId();
	}
	
	public void setUsuario(java.math.BigDecimal value) {
		this.usuario = value;
	}
	
	public java.math.BigDecimal getUsuario() {
		return usuario;
	}
	
	public void setFecha(java.sql.Timestamp value) {
		this.fecha = value;
	}
	
	public java.sql.Timestamp getFecha() {
		return fecha;
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
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
