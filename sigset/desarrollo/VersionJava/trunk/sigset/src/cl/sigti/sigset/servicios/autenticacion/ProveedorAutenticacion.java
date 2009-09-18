package cl.sigti.sigset.servicios.autenticacion;

import java.util.*;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.stereotype.Service;

import cl.sigti.sigset.modelo.Usuario;

@Service
public class ProveedorAutenticacion implements AuthenticationProvider {

	
	@Override
	public Authentication authenticate(Authentication arg0)
			throws AuthenticationException {
		
		UsuarioPasswordEmpresaToken token = (UsuarioPasswordEmpresaToken) arg0;
		
		if (token.getNombreUsuario().equals("test") && token.getPassword().equals("123")
				&& token.getEmpresa().equals("empresa1")) {
			
			GrantedAuthorityImpl gran = new GrantedAuthorityImpl("ROLE_ADMIN");
			List<GrantedAuthority> lista = new  ArrayList<GrantedAuthority>();
			lista.add(gran);
			
			Usuario usuario = new Usuario();
			usuario.setNombres("Juanito");
			usuario.setApellidoPaterno("Perez");
			
			return new UsuarioPasswordEmpresaToken(usuario, 
					token.getPassword(), token.getEmpresa(),lista );
		}
		return arg0;
	}

	@Override
	public boolean supports(Class<? extends Object> arg0) {
		
		return (arg0.equals(UsuarioPasswordEmpresaToken.class));
	}




}
