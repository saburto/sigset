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
public class UsuarioPermisos implements Serializable {
	public UsuarioPermisos() {
	}
	
	private int id;
	
	private int idEmpresa;
	
	private cl.sigti.sigset.modelo.Usuario IdUsuario;
	
	private int idPerfilPermiso;
	
	private boolean activo;
	
	private java.util.Set<cl.sigti.sigset.modelo.Permisos> Permisos = new java.util.HashSet<cl.sigti.sigset.modelo.Permisos>();
	
	private void setId(int value) {
		this.id = value;
	}
	
	public int getId() {
		return id;
	}
	
	public int getORMID() {
		return getId();
	}
	
	public void setIdEmpresa(int value) {
		this.idEmpresa = value;
	}
	
	public int getIdEmpresa() {
		return idEmpresa;
	}
	
	public void setIdPerfilPermiso(int value) {
		this.idPerfilPermiso = value;
	}
	
	public int getIdPerfilPermiso() {
		return idPerfilPermiso;
	}
	
	public void setActivo(boolean value) {
		this.activo = value;
	}
	
	public boolean getActivo() {
		return activo;
	}
	
	public void setIdUsuario(cl.sigti.sigset.modelo.Usuario value) {
		this.IdUsuario = value;
	}
	
	public cl.sigti.sigset.modelo.Usuario getIdUsuario() {
		return IdUsuario;
	}
	
	public void setPermisos(java.util.Set<cl.sigti.sigset.modelo.Permisos> value) {
		this.Permisos = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Permisos> getPermisos() {
		return Permisos;
	}
	
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
