package cl.sigti.sigset.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.jdo.annotations.Unique;

import cl.sigti.sigset.util.modelo.Form;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Empresa implements Serializable {


    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key id;
    
    @Persistent
    @Unique
    @Form(label="Nombre Corto")
    private String nombreCorto;
    
    @Persistent
    @Form(label="Nombre/Razón Social")
	private String nombre;
    
    @Persistent
    @Form(label="Rut")
    private Integer rut;
	
	@Persistent
	private Direccion direccion;
	
	@Persistent
	@Form(label="Correo Electronico")
	private String email;
	
	@Persistent
	@Form(label="Telefono")
	private String telefono;
	
	@Persistent
	private Usuario usuarioEncargado;
	
	@Persistent
	@Form(label="Fecha Inicio contrato")
	private Date inicioContrato;
	
	@Persistent
	@Form(label="Fecha Fin de contrato")
	private Date finContrato;
	
	@Persistent
	@Form(label="Observaciones")
	private String observaciones;
	
	@Persistent
	private Boolean activo;
	
	@Persistent
	@Form(label="Cantidad de Usuario")
	private Integer limiteUsuario;
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.Usuario> Usuarios = new java.util.HashSet<cl.sigti.sigset.modelo.Usuario>();
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.ClienteComercial> ClientesComercial = new java.util.HashSet<cl.sigti.sigset.modelo.ClienteComercial>();
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.ClienteParticular> ClientesParticular = new java.util.HashSet<cl.sigti.sigset.modelo.ClienteParticular>();
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> OrdenTrabajos = new java.util.HashSet<cl.sigti.sigset.modelo.OrdenTrabajo>();
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.Articulo> Articulos = new java.util.HashSet<cl.sigti.sigset.modelo.Articulo>();
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.TipoArticulo> TipoArticulos = new java.util.HashSet<cl.sigti.sigset.modelo.TipoArticulo>();
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.Categoria> Categorias = new java.util.HashSet<cl.sigti.sigset.modelo.Categoria>();
	
	@Persistent
	private java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> PerfilPermisos = new java.util.HashSet<cl.sigti.sigset.modelo.PerfilPermiso>();
	
	
	
	public String getNombre() {
		return nombre;
	}

	public java.util.Set<cl.sigti.sigset.modelo.Usuario> getUsuarios() {
		return Usuarios;
	}

	public void setUsuarios(java.util.Set<cl.sigti.sigset.modelo.Usuario> usuarios) {
		Usuarios = usuarios;
	}

	public java.util.Set<cl.sigti.sigset.modelo.ClienteComercial> getClientesComercial() {
		return ClientesComercial;
	}

	public void setClientesComercial(
			java.util.Set<cl.sigti.sigset.modelo.ClienteComercial> clientesComercial) {
		ClientesComercial = clientesComercial;
	}

	public java.util.Set<cl.sigti.sigset.modelo.ClienteParticular> getClientesParticular() {
		return ClientesParticular;
	}

	public void setClientesParticular(
			java.util.Set<cl.sigti.sigset.modelo.ClienteParticular> clientesParticular) {
		ClientesParticular = clientesParticular;
	}

	public java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> getOrdenTrabajos() {
		return OrdenTrabajos;
	}

	public void setOrdenTrabajos(
			java.util.Set<cl.sigti.sigset.modelo.OrdenTrabajo> ordenTrabajos) {
		OrdenTrabajos = ordenTrabajos;
	}

	public java.util.Set<cl.sigti.sigset.modelo.Articulo> getArticulos() {
		return Articulos;
	}

	public void setArticulos(
			java.util.Set<cl.sigti.sigset.modelo.Articulo> articulos) {
		Articulos = articulos;
	}

	public java.util.Set<cl.sigti.sigset.modelo.TipoArticulo> getTipoArticulos() {
		return TipoArticulos;
	}

	public void setTipoArticulos(
			java.util.Set<cl.sigti.sigset.modelo.TipoArticulo> tipoArticulos) {
		TipoArticulos = tipoArticulos;
	}

	public java.util.Set<cl.sigti.sigset.modelo.Categoria> getCategorias() {
		return Categorias;
	}

	public void setCategorias(
			java.util.Set<cl.sigti.sigset.modelo.Categoria> categorias) {
		Categorias = categorias;
	}

	public java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> getPerfilPermisos() {
		return PerfilPermisos;
	}

	public void setPerfilPermisos(
			java.util.Set<cl.sigti.sigset.modelo.PerfilPermiso> perfilPermisos) {
		PerfilPermisos = perfilPermisos;
	}

	public Boolean getActivo() {
		return activo;
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

	void setUsuarioEncargado(Usuario usuarioEncargado) {
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

	public void setNombreCorto(String nombreCorto) {
		this.nombreCorto = nombreCorto;
	}

	public String getNombreCorto() {
		return nombreCorto;
	}

	public void setRut(Integer rut) {
		this.rut = rut;
	}

	public Integer getRut() {
		return rut;
	}

	
}
