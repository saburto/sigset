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
public class PerfilPermiso implements Serializable {
	public PerfilPermiso() {
	}
	
	private int id;
	
	private cl.sigti.sigset.modelo.Empresa IdEmpresa;
	
	private cl.sigti.sigset.modelo.Perfil IdPerfil;
	
	private cl.sigti.sigset.modelo.Permisos IdPermiso;
	
	private boolean estado;
	
	private void setId(int value) {
		this.id = value;
	}
	
	public int getId() {
		return id;
	}
	
	public int getORMID() {
		return getId();
	}
	
	public void setEstado(boolean value) {
		this.estado = value;
	}
	
	public boolean getEstado() {
		return estado;
	}
	
	public void setIdEmpresa(cl.sigti.sigset.modelo.Empresa value) {
		this.IdEmpresa = value;
	}
	
	public cl.sigti.sigset.modelo.Empresa getIdEmpresa() {
		return IdEmpresa;
	}
	
	public void setIdPerfil(cl.sigti.sigset.modelo.Perfil value) {
		this.IdPerfil = value;
	}
	
	public cl.sigti.sigset.modelo.Perfil getIdPerfil() {
		return IdPerfil;
	}
	
	public void setIdPermiso(cl.sigti.sigset.modelo.Permisos value) {
		this.IdPermiso = value;
	}
	
	public cl.sigti.sigset.modelo.Permisos getIdPermiso() {
		return IdPermiso;
	}
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}
