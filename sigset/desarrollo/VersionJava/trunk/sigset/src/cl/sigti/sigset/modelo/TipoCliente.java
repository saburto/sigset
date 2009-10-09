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
public class TipoCliente implements Serializable {
	public TipoCliente() {
	}
	
	private Long id;
	
	private String descripcion;
	
	private java.util.Set<cl.sigti.sigset.modelo.Cliente> Cliente = new java.util.HashSet<cl.sigti.sigset.modelo.Cliente>();
	
	private void setId(Long value) {
		this.id = value;
	}
	
	public Long getId() {
		return id;
	}
	
	public Long getORMID() {
		return getId();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setCliente(java.util.Set<cl.sigti.sigset.modelo.Cliente> value) {
		this.Cliente = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Cliente> getCliente() {
		return Cliente;
	}
	
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
