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

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Contacto implements Serializable {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key id;
	
	@Persistent
	private cl.sigti.sigset.modelo.ClienteParticular ContactoClienteDistribuidor;
	
	@Persistent
	private cl.sigti.sigset.modelo.TipoContacto TipoContacto;
	
	@Persistent
	private String valorContacto;
	
	@Persistent
	private cl.sigti.sigset.modelo.ClienteComercial ContactoClienteDistribuidor1;
	
	public void setId(Key value) {
		this.id = value;
	}
	
	public Key getId() {
		return id;
	}
	
	public Key getORMID() {
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
