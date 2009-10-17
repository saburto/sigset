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
public class Modulos implements Serializable {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key id;
	
	@Persistent
	private String nombreModulo;
	
	@Persistent
	private String descripcionOpcion;
	
		
	public void setId(Key id) {
		this.id = id;
	}
	
	public Key getId() {
		return id;
	}
	
		
	public void setNombreModulo(String value) {
		this.nombreModulo = value;
	}
	
	public String getNombreModulo() {
		return nombreModulo;
	}
	
	public void setDescripcionOpcion(String value) {
		this.descripcionOpcion = value;
	}
	
	public String getDescripcionOpcion() {
		return descripcionOpcion;
	}
	
	
}
