package cl.sigti.sigset.servicios.autenticacion;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

public class AutenticacionEntryPoint extends
		LoginUrlAuthenticationEntryPoint {
	
	@Override
	public void commence(HttpServletRequest arg0, HttpServletResponse arg1,
			AuthenticationException arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//arg0.getSession().setMaxInactiveInterval(3*60);
		
		super.commence(arg0, arg1, arg2);
	}
}
