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
public class Permisos implements Serializable {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key id;
	
	@Persistent
	private Modulos modulo;
	
	@Persistent
	private String opcion;
	
	@Persistent
	private String descripcionOpcion;
	
	
	public void setOpcion(String value) {
		this.opcion = value;
	}
	
	public String getOpcion() {
		return opcion;
	}
	
	public void setDescripcionOpcion(String value) {
		this.descripcionOpcion = value;
	}
	
	public String getDescripcionOpcion() {
		return descripcionOpcion;
	}
	
	public void setIdModulo(Modulos value) {
		this.modulo = value;
	}
	
	public Modulos getIdModulo() {
		return modulo;
	}

	public void setId(Key id) {
		this.id = id;
	}

	public Key getId() {
		return id;
	}
	
}
