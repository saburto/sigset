package cl.sigti.sigset.servicios.autenticacion;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;

public class AutenticacionFiltro extends AbstractAuthenticationProcessingFilter {

	public AutenticacionFiltro(
			){
		this("/login/iniciar/");
	}
	
	protected AutenticacionFiltro(String defaultFilterProcessesUrl) {
		super(defaultFilterProcessesUrl);
		// TODO Auto-generated constructor stub
		 
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException,
			IOException, ServletException {
		
		if (!request.getMethod().equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        }
		
		String nombreUsuario = request.getParameter("nombre_usuario");
        String password = request.getParameter("password");
        String empresa = request.getParameter("empresa");

        if (nombreUsuario == null) {
            nombreUsuario = "";
        }

        if (password == null) {
            password = "";
        }
        
        if (empresa == null) {
			empresa = "";
		}
        
        nombreUsuario = nombreUsuario.trim();
        empresa = empresa.trim();
        
        UsuarioPasswordEmpresaToken token = new UsuarioPasswordEmpresaToken(nombreUsuario, password, empresa);
        setDetails(request, token);
		
		return this.getAuthenticationManager().authenticate(token);

	}
	
    protected void setDetails(HttpServletRequest request, UsuarioPasswordEmpresaToken authRequest) {
        authRequest.setDetails(authenticationDetailsSource.buildDetails(request));
    }


}
