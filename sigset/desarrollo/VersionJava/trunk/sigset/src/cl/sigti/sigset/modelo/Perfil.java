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
public class Perfil implements Serializable {	
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key id;
	
	@Persistent
	private String descripcion;
	
	@Persistent
	private Key idEmpresa;
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.Usuario> Usuario = new java.util.HashSet<cl.sigti.sigset.modelo.Usuario>();
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> PerfilPermiso = new java.util.HashSet<cl.sigti.sigset.modelo.PerfilPermiso>();

	
	public void setId(Key value) {
		this.id = value;
	}
	
	public Key getId() {
		return id;
	}
	
	public Key getORMID() {
		return getId();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setIdEmpresa(Key value) {
		this.idEmpresa = value;
	}
	
	public Key getIdEmpresa() {
		return idEmpresa;
	}
	
	public void setUsuario(java.util.Set<cl.sigti.sigset.modelo.Usuario> value) {
		this.Usuario = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Usuario> getUsuario() {
		return Usuario;
	}
	
	
	public void setPerfilPermiso(java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> value) {
		this.PerfilPermiso = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> getPerfilPermiso() {
		return PerfilPermiso;
	}
	
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
