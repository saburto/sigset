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
public class TipoEspecialidad implements Serializable {
	public TipoEspecialidad() {
	}
	
	private java.math.BigDecimal idTipoEspecialidad;
	
	private String descripcion;
	
	private int idEmpresa;
	
	private java.util.Set<cl.sigti.sigset.modelo.Especialidades> Especialidades = new java.util.HashSet<cl.sigti.sigset.modelo.Especialidades>();
	
	public void setIdTipoEspecialidad(java.math.BigDecimal value) {
		this.idTipoEspecialidad = value;
	}
	
	public java.math.BigDecimal getIdTipoEspecialidad() {
		return idTipoEspecialidad;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdTipoEspecialidad();
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
	
	public void setEspecialidades(java.util.Set<cl.sigti.sigset.modelo.Especialidades> value) {
		this.Especialidades = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Especialidades> getEspecialidades() {
		return Especialidades;
	}
	
	
	public String toString() {
		return String.valueOf(getIdTipoEspecialidad());
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
