package cl.sigti.sigset.servicios.autenticacion;

import java.util.List;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

@SuppressWarnings("serial")
public class UsuarioPasswordEmpresaToken extends AbstractAuthenticationToken {

	private final Object nombreUsuario;
	private final Object password;
	private final Object empresa;
	

	public UsuarioPasswordEmpresaToken(Object nombreUsuario, Object password, Object empresa) {
		super(null);
		this.nombreUsuario = nombreUsuario;
		this.password = password;
		this.empresa = empresa;
		setAuthenticated(false);

	}
	
    public UsuarioPasswordEmpresaToken(Object nombreUsuario, Object password,Object empresa, List<GrantedAuthority> authorities, Object details) {
        super(authorities);
        this.nombreUsuario = nombreUsuario;
        this.password = password;
        this.empresa = empresa;
        super.setDetails(details);
        super.setAuthenticated(true); // must use super, as we override
    }


	@Override
	public Object getCredentials() {
		// TODO Auto-generated method stub
		return this.password;
	}

	@Override
	public Object getPrincipal() {
		// TODO Auto-generated method stub
		return this.nombreUsuario;
	}

	public Object getNombreUsuario() {
		return nombreUsuario;
	}

	public Object getPassword() {
		return password;
	}

	public Object getEmpresa() {
		return empresa;
	}
}
