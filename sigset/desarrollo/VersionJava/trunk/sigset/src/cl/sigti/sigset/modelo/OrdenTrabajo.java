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
public class OrdenTrabajo implements Serializable {
	public OrdenTrabajo() {
	}
	
	private java.math.BigDecimal id;
	
	private cl.sigti.sigset.modelo.Articulo IdArticulo;
	
	private String serie;
	
	private java.sql.Timestamp fechaIngreso;
	
	private java.sql.Timestamp fechaEntrega;
	
	private String falla;
	
	private String condicionArticulo;
	
	private cl.sigti.sigset.modelo.TipoOrden TipoOrden;
	
	private String boleta;
	
	private String poliza;
	
	private java.sql.Timestamp fechaCompra;
	
	private String lugarCompra;
	
	private cl.sigti.sigset.modelo.Empresa IdEmpresa;
	
	private cl.sigti.sigset.modelo.Cliente IdCliente;
	
	private int idTecnicoAsignado;
	
	private String observacion;
	
	private java.util.Set<cl.sigti.sigset.modelo.Detalle> Detalle = new java.util.HashSet<cl.sigti.sigset.modelo.Detalle>();
	
	private java.util.Set<cl.sigti.sigset.modelo.HistorialModificacionOrden> HistorialModificacionOrden = new java.util.HashSet<cl.sigti.sigset.modelo.HistorialModificacionOrden>();
	
	private cl.sigti.sigset.modelo.Tecnicos Tecnicos;
	
	private void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	
	public java.math.BigDecimal getId() {
		return id;
	}
	
	public java.math.BigDecimal getORMID() {
		return getId();
	}
	
	public void setSerie(String value) {
		this.serie = value;
	}
	
	public String getSerie() {
		return serie;
	}
	
	public void setFechaIngreso(java.sql.Timestamp value) {
		this.fechaIngreso = value;
	}
	
	public java.sql.Timestamp getFechaIngreso() {
		return fechaIngreso;
	}
	
	public void setFechaEntrega(java.sql.Timestamp value) {
		this.fechaEntrega = value;
	}
	
	public java.sql.Timestamp getFechaEntrega() {
		return fechaEntrega;
	}
	
	public void setFalla(String value) {
		this.falla = value;
	}
	
	public String getFalla() {
		return falla;
	}
	
	public void setCondicionArticulo(String value) {
		this.condicionArticulo = value;
	}
	
	public String getCondicionArticulo() {
		return condicionArticulo;
	}
	
	public void setBoleta(String value) {
		this.boleta = value;
	}
	
	public String getBoleta() {
		return boleta;
	}
	
	public void setPoliza(String value) {
		this.poliza = value;
	}
	
	public String getPoliza() {
		return poliza;
	}
	
	public void setFechaCompra(java.sql.Timestamp value) {
		this.fechaCompra = value;
	}
	
	public java.sql.Timestamp getFechaCompra() {
		return fechaCompra;
	}
	
	public void setLugarCompra(String value) {
		this.lugarCompra = value;
	}
	
	public String getLugarCompra() {
		return lugarCompra;
	}
	
	public void setIdTecnicoAsignado(int value) {
		this.idTecnicoAsignado = value;
	}
	
	public int getIdTecnicoAsignado() {
		return idTecnicoAsignado;
	}
	
	/**
	 * Campo extra.
	 */
	public void setObservacion(String value) {
		this.observacion = value;
	}
	
	/**
	 * Campo extra.
	 */
	public String getObservacion() {
		return observacion;
	}
	
	public void setIdArticulo(cl.sigti.sigset.modelo.Articulo value) {
		this.IdArticulo = value;
	}
	
	public cl.sigti.sigset.modelo.Articulo getIdArticulo() {
		return IdArticulo;
	}
	
	public void setTipoOrden(cl.sigti.sigset.modelo.TipoOrden value) {
		this.TipoOrden = value;
	}
	
	public cl.sigti.sigset.modelo.TipoOrden getTipoOrden() {
		return TipoOrden;
	}
	
	public void setIdEmpresa(cl.sigti.sigset.modelo.Empresa value) {
		this.IdEmpresa = value;
	}
	
	public cl.sigti.sigset.modelo.Empresa getIdEmpresa() {
		return IdEmpresa;
	}
	
	public void setIdCliente(cl.sigti.sigset.modelo.Cliente value) {
		this.IdCliente = value;
	}
	
	public cl.sigti.sigset.modelo.Cliente getIdCliente() {
		return IdCliente;
	}
	
	public void setDetalle(java.util.Set<cl.sigti.sigset.modelo.Detalle> value) {
		this.Detalle = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Detalle> getDetalle() {
		return Detalle;
	}
	
	
	public void setHistorialModificacionOrden(java.util.Set<cl.sigti.sigset.modelo.HistorialModificacionOrden> value) {
		this.HistorialModificacionOrden = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.HistorialModificacionOrden> getHistorialModificacionOrden() {
		return HistorialModificacionOrden;
	}
	
	
	public void setTecnicos(cl.sigti.sigset.modelo.Tecnicos value) {
		this.Tecnicos = value;
	}
	
	public cl.sigti.sigset.modelo.Tecnicos getTecnicos() {
		return Tecnicos;
	}
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
