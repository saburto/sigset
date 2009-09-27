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
public class Nivel implements Serializable {
	public Nivel() {
	}
	
	private java.math.BigDecimal idNivel;
	
	private String descripcion;
	
	private Integer idEmpresa;
	
	private java.util.Set<cl.sigti.sigset.modelo.Tecnicos> Tecnicos = new java.util.HashSet<cl.sigti.sigset.modelo.Tecnicos>();
	
	public void setIdNivel(java.math.BigDecimal value) {
		this.idNivel = value;
	}
	
	public java.math.BigDecimal getIdNivel() {
		return idNivel;
	}
	
	public java.math.BigDecimal getORMID() {
		return getIdNivel();
	}
	
	public void setDescripcion(String value) {
		this.descripcion = value;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setIdEmpresa(int value) {
		setIdEmpresa(new Integer(value));
	}
	
	public void setIdEmpresa(Integer value) {
		this.idEmpresa = value;
	}
	
	public Integer getIdEmpresa() {
		return idEmpresa;
	}
	
	public void setTecnicos(java.util.Set<cl.sigti.sigset.modelo.Tecnicos> value) {
		this.Tecnicos = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Tecnicos> getTecnicos() {
		return Tecnicos;
	}
	
	
	public String toString() {
		return String.valueOf(getIdNivel());
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
