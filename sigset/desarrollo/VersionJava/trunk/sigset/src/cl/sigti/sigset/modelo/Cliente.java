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
public class Cliente implements Serializable {
	public Cliente() {
	}
	
	private int id;
	
	private cl.sigti.sigset.modelo.TipoCliente IdTipoCliente;
	
	private String observacion;
	
	private cl.sigti.sigset.modelo.ClienteComercial ClienteComercial;
	
	private cl.sigti.sigset.modelo.ClienteParticular ClienteParticular;
	
	private java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> OrdenTrabajo = new java.util.HashSet<cl.sigti.sigset.modelo.OrdenTrabajo>();
	
	private void setId(int value) {
		this.id = value;
	}
	
	public int getId() {
		return id;
	}
	
	public int getORMID() {
		return getId();
	}
	
	public void setObservacion(String value) {
		this.observacion = value;
	}
	
	public String getObservacion() {
		return observacion;
	}
	
	public void setIdTipoCliente(cl.sigti.sigset.modelo.TipoCliente value) {
		this.IdTipoCliente = value;
	}
	
	public cl.sigti.sigset.modelo.TipoCliente getIdTipoCliente() {
		return IdTipoCliente;
	}
	
	public void setClienteComercial(cl.sigti.sigset.modelo.ClienteComercial value) {
		this.ClienteComercial = value;
	}
	
	public cl.sigti.sigset.modelo.ClienteComercial getClienteComercial() {
		return ClienteComercial;
	}
	
	public void setClienteParticular(cl.sigti.sigset.modelo.ClienteParticular value) {
		this.ClienteParticular = value;
	}
	
	public cl.sigti.sigset.modelo.ClienteParticular getClienteParticular() {
		return ClienteParticular;
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
