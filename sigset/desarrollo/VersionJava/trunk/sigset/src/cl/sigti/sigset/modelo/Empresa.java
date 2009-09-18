package cl.sigti.sigset.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Empresa implements Serializable {


    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key id;

	
	@Persistent
	private String nombre;
	
	@Persistent
	private Direccion direccion;
	
	@Persistent
	private String email;
	
	@Persistent
	private String telefono;
	
	@Persistent
	private Usuario usuarioEncargado;
	
	@Persistent
	private Date inicioContrato;
	
	@Persistent
	private Date finContrato;
	
	@Persistent
	private String observaciones;
	
	private Boolean activo;
	


	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}


	public Usuario getUsuarioEncargado() {
		return usuarioEncargado;
	}

	public void setUsuarioEncargado(Usuario usuarioEncargado) {
		this.usuarioEncargado = usuarioEncargado;
	}

	public Date getInicioContrato() {
		return inicioContrato;
	}

	public void setInicioContrato(Date inicioContrato) {
		this.inicioContrato = inicioContrato;
	}

	public Date getFinContrato() {
		return finContrato;
	}

	public void setFinContrato(Date finContrato) {
		this.finContrato = finContrato;
	}

	public Integer getLimiteUsuario() {
		return limiteUsuario;
	}

	public void setLimiteUsuario(Integer limiteUsuario) {
		this.limiteUsuario = limiteUsuario;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public Boolean isActivo() {
		return activo;
	}

	public void setId(Key id) {
		this.id = id;
	}

	public Key getId() {
		return id;
	}

	@Persistent
	private Integer limiteUsuario;
	
}
