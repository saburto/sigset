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
public class Modulos implements Serializable {
	public Modulos() {
	}
	
	private int id;
	
	private String nombreModulo;
	
	private String descripcionOpcion;
	
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
