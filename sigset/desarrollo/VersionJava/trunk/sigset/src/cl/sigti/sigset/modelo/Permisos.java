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
public class Permisos implements Serializable {
	public Permisos() {
	}
	
	private cl.sigti.sigset.modelo.UsuarioPermisos UsuarioPermisos;
	
	private cl.sigti.sigset.modelo.Modulos IdModulo;
	
	private String opcion;
	
	private String descripcionOpcion;
	
	private java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> PerfilPermiso = new java.util.HashSet<cl.sigti.sigset.modelo.PerfilPermiso>();
	
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
	
	public void setIdModulo(cl.sigti.sigset.modelo.Modulos value) {
		this.IdModulo = value;
	}
	
	public cl.sigti.sigset.modelo.Modulos getIdModulo() {
		return IdModulo;
	}
	
	public void setUsuarioPermisos(cl.sigti.sigset.modelo.UsuarioPermisos value) {
		this.UsuarioPermisos = value;
	}
	
	public cl.sigti.sigset.modelo.UsuarioPermisos getUsuarioPermisos() {
		return UsuarioPermisos;
	}
	
	public cl.sigti.sigset.modelo.UsuarioPermisos getORMID() {
		return getUsuarioPermisos();
	}
	
	public void setPerfilPermiso(java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> value) {
		this.PerfilPermiso = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> getPerfilPermiso() {
		return PerfilPermiso;
	}
	
	
	public String toString() {
		return String.valueOf(((getUsuarioPermisos() == null) ? "" : String.valueOf(getUsuarioPermisos().getORMID())));
	}
	
}
