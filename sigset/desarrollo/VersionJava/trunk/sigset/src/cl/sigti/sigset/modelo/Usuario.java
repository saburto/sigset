package cl.sigti.sigset.modelo;

import java.io.Serializable;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

import cl.sigti.sigset.util.modelo.Form;
import cl.sigti.sigset.util.modelo.InputType;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Usuario implements Serializable{
	
	@Persistent(valueStrategy= IdGeneratorStrategy.IDENTITY)
	@PrimaryKey
	private Key id;
	

	@Persistent
	@Form(label="Nombre Usuario",columna=0, fila=3)
	private String usuario;
	
	@Persistent
	@Form(label="Constraseña", type=InputType.PASSWORD, columna=1, fila=3)
	private String password;
	
	@Persistent
	private Perfil perfil;
	
	@Persistent
	private Empresa empresa;
	
	@Persistent
	@Form(label="Nombres", columna=0, fila=1)
	private String nombres;
	
	@Persistent
	@Form(label="Apellido Paterno", columna=1, fila=1)
	private String apellidoPaterno;

	@Persistent
	@Form(label="Apellido Materno", columna=2, fila=1)
	private String apellidoMaterno;
	
	@Persistent
	@Form(label="Email", columna=0, fila=2)
	private String email;
	
	@Persistent
	@Form(label="Rut", columna=0, fila=0)
	private Integer rut;
	
	@Persistent
	@Form(label="Telefono", columna=1, fila=2)
	private String telefono;
	

	@Persistent
	private Boolean activo;
		
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.Tecnicos> Tecnicos = new java.util.HashSet<cl.sigti.sigset.modelo.Tecnicos>();
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.UsuarioPermisos> UsuarioPermisos = new java.util.HashSet<cl.sigti.sigset.modelo.UsuarioPermisos>();
	
	public Key getId() {
		return id;
	}

	public void setId(Key id) {
		this.id = id;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}
	
	
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String nombreUsuario) {
		this.usuario = nombreUsuario;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getRut() {
		return rut;
	}

	public void setRut(Integer rut) {
		this.rut = rut;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	
	public String getNombresApellido(){
		return (this.nombres != null ? this.nombres :"") + " " + (this.apellidoPaterno != null ? this.apellidoPaterno : "");
	}
	
	@Override
	public boolean equals(Object object){
		
		if(object == null && !(object instanceof Usuario)){
			return false;	
		}
		else{
			Usuario otroUsuario = (Usuario) object;
			
			if(this.nombres != null && otroUsuario.nombres != null 
					/*&& this.empresa != null && otroUsuario.empresa != null*/
					){
				if (this.nombres.equals(otroUsuario.nombres) 
						/*&& this.empresa.equals(otroUsuario.empresa)*/
						) {
					return true;
				}
			}
			return false;
		}
	}
	
	@Override
	public int hashCode(){
		return this.nombres != null ? this.nombres.hashCode(): 0;
		//return  id.intValue();
	}
	
	@Override
	public String toString(){
		return this.nombres;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public Perfil getPerfil() {
		return perfil;
	}

	public void setTecnicos(java.util.Set<cl.sigti.sigset.modelo.Tecnicos> tecnicos) {
		Tecnicos = tecnicos;
	}

	public java.util.Set<cl.sigti.sigset.modelo.Tecnicos> getTecnicos() {
		return Tecnicos;
	}

	public void setUsuarioPermisos(java.util.Set<cl.sigti.sigset.modelo.UsuarioPermisos> usuarioPermisos) {
		UsuarioPermisos = usuarioPermisos;
	}

	public java.util.Set<cl.sigti.sigset.modelo.UsuarioPermisos> getUsuarioPermisos() {
		return UsuarioPermisos;
	}
	
}
