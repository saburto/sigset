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
public class Tecnicos implements Serializable {
	public Tecnicos() {
	}
	
	private cl.sigti.sigset.modelo.OrdenTrabajo OrdenTrabajo;
	
	private cl.sigti.sigset.modelo.Nivel Nivel;
	
	private cl.sigti.sigset.modelo.Usuario IdUsuario;
	
	private java.util.Set<cl.sigti.sigset.modelo.Especialidades> Especialidades = new java.util.HashSet<cl.sigti.sigset.modelo.Especialidades>();
	
	public void setNivel(cl.sigti.sigset.modelo.Nivel value) {
		this.Nivel = value;
	}
	
	public cl.sigti.sigset.modelo.Nivel getNivel() {
		return Nivel;
	}
	
	public void setIdUsuario(cl.sigti.sigset.modelo.Usuario value) {
		this.IdUsuario = value;
	}
	
	public cl.sigti.sigset.modelo.Usuario getIdUsuario() {
		return IdUsuario;
	}
	
	public void setOrdenTrabajo(cl.sigti.sigset.modelo.OrdenTrabajo value) {
		this.OrdenTrabajo = value;
	}
	
	public cl.sigti.sigset.modelo.OrdenTrabajo getOrdenTrabajo() {
		return OrdenTrabajo;
	}
	
	public cl.sigti.sigset.modelo.OrdenTrabajo getORMID() {
		return getOrdenTrabajo();
	}
	
	public void setEspecialidades(java.util.Set<cl.sigti.sigset.modelo.Especialidades> value) {
		this.Especialidades = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Especialidades> getEspecialidades() {
		return Especialidades;
	}
	
	
	public String toString() {
		return String.valueOf(((getOrdenTrabajo() == null) ? "" : String.valueOf(getOrdenTrabajo().getORMID())));
	}
	
}
