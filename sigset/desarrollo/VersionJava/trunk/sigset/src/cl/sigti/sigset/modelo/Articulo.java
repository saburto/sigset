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
@SuppressWarnings("serial")
public class Articulo implements Serializable {
	public Articulo() {
	}
	
	private java.math.BigDecimal id;
	
	private String modelo;
	
	private cl.sigti.sigset.modelo.Marca Marca;
	
	private cl.sigti.sigset.modelo.TipoArticulo TipoArticulo;
	
	private cl.sigti.sigset.modelo.Categoria Categoria;
	
	private cl.sigti.sigset.modelo.PrecioGarantia PrecioGarantia;
	
	private cl.sigti.sigset.modelo.Linea Linea;
	
	private cl.sigti.sigset.modelo.Empresa IdEmpresa;
	
	private String observacion;
	
	private java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> OrdenTrabajo = new java.util.HashSet<cl.sigti.sigset.modelo.OrdenTrabajo>();
	
	private void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	
	public java.math.BigDecimal getId() {
		return id;
	}
	
	public java.math.BigDecimal getORMID() {
		return getId();
	}
	
	public void setModelo(String value) {
		this.modelo = value;
	}
	
	public String getModelo() {
		return modelo;
	}
	
	public void setObservacion(String value) {
		this.observacion = value;
	}
	
	public String getObservacion() {
		return observacion;
	}
	
	public void setMarca(cl.sigti.sigset.modelo.Marca value) {
		this.Marca = value;
	}
	
	public cl.sigti.sigset.modelo.Marca getMarca() {
		return Marca;
	}
	
	public void setTipoArticulo(cl.sigti.sigset.modelo.TipoArticulo value) {
		this.TipoArticulo = value;
	}
	
	public cl.sigti.sigset.modelo.TipoArticulo getTipoArticulo() {
		return TipoArticulo;
	}
	
	public void setCategoria(cl.sigti.sigset.modelo.Categoria value) {
		this.Categoria = value;
	}
	
	public cl.sigti.sigset.modelo.Categoria getCategoria() {
		return Categoria;
	}
	
	public void setPrecioGarantia(cl.sigti.sigset.modelo.PrecioGarantia value) {
		this.PrecioGarantia = value;
	}
	
	public cl.sigti.sigset.modelo.PrecioGarantia getPrecioGarantia() {
		return PrecioGarantia;
	}
	
	public void setLinea(cl.sigti.sigset.modelo.Linea value) {
		this.Linea = value;
	}
	
	public cl.sigti.sigset.modelo.Linea getLinea() {
		return Linea;
	}
	
	public void setIdEmpresa(cl.sigti.sigset.modelo.Empresa value) {
		this.IdEmpresa = value;
	}
	
	public cl.sigti.sigset.modelo.Empresa getIdEmpresa() {
		return IdEmpresa;
	}
	
	public void setOrdenTrabajo(java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> value) {
		this.OrdenTrabajo = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> getOrdenTrabajo() {
		return OrdenTrabajo;
	}
	
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
