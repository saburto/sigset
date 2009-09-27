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
public class PrecioGarantia implements Serializable {
	public PrecioGarantia() {
	}
	
	private java.math.BigDecimal idPrecioGarantia;
	
	private java.math.BigDecimal valorRevision;
	
	private java.math.BigDecimal valorReparacion;
	
	private java.util.Set<cl.sigti.sigset.modelo.Articulo> Articulo = new java.util.HashSet<cl.sigti.sigset.modelo.Articulo>();
	
	private java.util.Set<cl.sigti.sigset.modelo.Porcentaje> Porcentaje = new java.util.HashSet<cl.sigti.sigset.modelo.Porcentaje>();
	
	public void setIdPrecioGarantia(java.math.BigDecimal value) {
		this.idPrecioGarantia = value;
	}
	
	public java.math.BigDecimal getIdPrecioGarantia() {
		return idPrecioGarantia;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdPrecioGarantia();
	}
	
	public void setValorRevision(java.math.BigDecimal value) {
		this.valorRevision = value;
	}
	
	public java.math.BigDecimal getValorRevision() {
		return valorRevision;
	}
	
	public void setValorReparacion(java.math.BigDecimal value) {
		this.valorReparacion = value;
	}
	
	public java.math.BigDecimal getValorReparacion() {
		return valorReparacion;
	}
	
	public void setArticulo(java.util.Set<cl.sigti.sigset.modelo.Articulo> value) {
		this.Articulo = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Articulo> getArticulo() {
		return Articulo;
	}
	
	
	public void setPorcentaje(java.util.Set<cl.sigti.sigset.modelo.Porcentaje> value) {
		this.Porcentaje = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Porcentaje> getPorcentaje() {
		return Porcentaje;
	}
	
	
	public String toString() {
		return String.valueOf(getIdPrecioGarantia());
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
