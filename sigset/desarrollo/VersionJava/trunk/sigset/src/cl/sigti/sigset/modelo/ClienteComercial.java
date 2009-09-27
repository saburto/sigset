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
public class ClienteComercial implements Serializable {
	public ClienteComercial() {
	}
	
	private cl.sigti.sigset.modelo.Cliente Cliente;
	
	private int rut;
	
	private String razonSocial;
	
	private String sucursal;
	
	private cl.sigti.sigset.modelo.Direccion IdDireccion;
	
	private cl.sigti.sigset.modelo.Empresa IdEmpresa;
	
	private java.util.Set<cl.sigti.sigset.modelo.Contacto> Contacto = new java.util.HashSet<cl.sigti.sigset.modelo.Contacto>();
	
	public void setRut(int value) {
		this.rut = value;
	}
	
	public int getRut() {
		return rut;
	}
	
	public void setRazonSocial(String value) {
		this.razonSocial = value;
	}
	
	public String getRazonSocial() {
		return razonSocial;
	}
	
	public void setSucursal(String value) {
		this.sucursal = value;
	}
	
	public String getSucursal() {
		return sucursal;
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
	
	
	public String toString() {
		return String.valueOf(((getCliente() == null) ? "" : String.valueOf(getCliente().getORMID())));
	}
	
}
