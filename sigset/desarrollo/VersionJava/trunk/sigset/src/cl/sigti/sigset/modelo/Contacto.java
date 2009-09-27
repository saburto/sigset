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
public class Contacto implements Serializable {
	public Contacto() {
	}
	
	private java.math.BigDecimal id;
	
	private cl.sigti.sigset.modelo.ClienteParticular ContactoClienteDistribuidor;
	
	private cl.sigti.sigset.modelo.TipoContacto TipoContacto;
	
	private String valorContacto;
	
	private cl.sigti.sigset.modelo.ClienteComercial ContactoClienteDistribuidor1;
	
	private void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	
	public java.math.BigDecimal getId() {
		return id;
	}
	
	public java.math.BigDecimal getORMID() {
		return getId();
	}
	
	public void setValorContacto(String value) {
		this.valorContacto = value;
	}
	
	public String getValorContacto() {
		return valorContacto;
	}
	
	public void setTipoContacto(cl.sigti.sigset.modelo.TipoContacto value) {
		this.TipoContacto = value;
	}
	
	public cl.sigti.sigset.modelo.TipoContacto getTipoContacto() {
		return TipoContacto;
	}
	
	public void setContactoClienteDistribuidor(cl.sigti.sigset.modelo.ClienteParticular value) {
		this.ContactoClienteDistribuidor = value;
	}
	
	public cl.sigti.sigset.modelo.ClienteParticular getContactoClienteDistribuidor() {
		return ContactoClienteDistribuidor;
	}
	
	public void setContactoClienteDistribuidor1(cl.sigti.sigset.modelo.ClienteComercial value) {
		this.ContactoClienteDistribuidor1 = value;
	}
	
	public cl.sigti.sigset.modelo.ClienteComercial getContactoClienteDistribuidor1() {
		return ContactoClienteDistribuidor1;
	}
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
