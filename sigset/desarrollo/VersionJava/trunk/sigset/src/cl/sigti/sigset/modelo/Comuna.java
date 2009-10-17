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
import java.math.BigDecimal;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Comuna implements Serializable {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key id;
	
	@Persistent
	private cl.sigti.sigset.modelo.Provincia IdProvincia;
	
	@Persistent
	private String nombre;
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.Direccion> Direccion = new java.util.HashSet<cl.sigti.sigset.modelo.Direccion>();
	
	public void setId(Key value) {
		this.id = value;
	}
	
	public Key getId() {
		return id;
	}
	
	public Key getORMID() {
		return getId();
	}
	
	public void setNombre(String value) {
		this.nombre = value;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setIdProvincia(cl.sigti.sigset.modelo.Provincia value) {
		this.IdProvincia = value;
	}
	
	public cl.sigti.sigset.modelo.Provincia getIdProvincia() {
		return IdProvincia;
	}
	
	public void setDireccion(java.util.Set<cl.sigti.sigset.modelo.Direccion> value) {
		this.Direccion = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Direccion> getDireccion() {
		return Direccion;
	}
	
	
	public String toString() {
		return String.valueOf(getId());
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
