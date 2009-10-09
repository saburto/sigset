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
public class ClienteParticular implements Serializable {
	public ClienteParticular() {
	}
	
	private java.math.BigDecimal rut;
	
	private String nombre;
	
	private String apellidoPaterno;
	
	private String apellidoMaterno;
	
	private cl.sigti.sigset.modelo.Cliente Cliente;
	
	private cl.sigti.sigset.modelo.Direccion IdDireccion;
	
	private cl.sigti.sigset.modelo.Empresa IdEmpresa;
	
	private java.util.Set<cl.sigti.sigset.modelo.Contacto> Contacto = new java.util.HashSet<cl.sigti.sigset.modelo.Contacto>();
	
	public void setRut(java.math.BigDecimal value) {
		this.rut = value;
	}
	
	public java.math.BigDecimal getRut() {
		return rut;
	}
	
	public void setNombre(String value) {
		this.nombre = value;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setApellidoPaterno(String value) {
		this.apellidoPaterno = value;
	}
	
	public String getApellidoPaterno() {
		return apellidoPaterno;
	}
	
	public void setApellidoMaterno(String value) {
		this.apellidoMaterno = value;
	}
	
	public String getApellidoMaterno() {
		return apellidoMaterno;
	}
	
	public void setIdDireccion(cl.sigti.sigset.modelo.Direccion value) {
		this.IdDireccion = value;
	}
	
	public cl.sigti.sigset.modelo.Direccion getIdDireccion() {
		return IdDireccion;
	}
	
	public void setIdEmpresa(cl.sigti.sigset.modelo.Empresa value) {
		this.IdEmpresa = value;
	}
	
	public cl.sigti.sigset.modelo.Empresa getIdEmpresa() {
		return IdEmpresa;
	}
	
	public void setCliente(cl.sigti.sigset.modelo.Cliente value) {
		this.Cliente = value;
	}
	
	public cl.sigti.sigset.modelo.Cliente getCliente() {
		return Cliente;
	}
	
	public cl.sigti.sigset.modelo.Cliente getORMID() {
		return getCliente();
	}
	
	public void setContacto(java.util.Set<cl.sigti.sigset.modelo.Contacto> value) {
		this.Contacto = value;
	}
	
	public java.util.Set<cl.sigti.sigset.modelo.Contacto> getContacto() {
		return Contacto;
	}
	

	
}
