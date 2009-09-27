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
public class Perfil implements Serializable {
	public Perfil() {
	}
	
	private int id;
	
	private String descripcion;
	
	private int idEmpresa;
	
	private java.util.Set<cl.sigti.sigset.modelo.Usuario> Usuario = new java.util.HashSet<cl.sigti.sigset.modelo.Usuario>();
	
	private java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> PerfilPermiso = new java.util.HashSet<cl.sigti.sigset.modelo.PerfilPermiso>();
	
	private void setId(int value) {
		this.id = value;
	}
	
	public int getId() {
		return id;
	}
	
	public int getORMID() {
		return getId();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setIdEmpresa(int value) {
		this.idEmpresa = value;
	}
	
	public int getIdEmpresa() {
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
