package cl.sigti.sigset.servicios.autenticacion;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.concurrent.SessionRegistry;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.filter.GenericFilterBean;

public class LogoutFiltro extends GenericFilterBean {

	private SessionRegistry sessionRegistry;
	private String filterProcessesUrl = "/logout/";
	private LogoutHandler[] handlers = new LogoutHandler[] { new SecurityContextLogoutHandler() };

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		if (requiresLogout(request, response)) {
		
		HttpSession session = request.getSession(false);

		sessionRegistry.removeSessionInformation(session.getId());

		doLogout(request, response);

		String targetUrl = "/";
		if (targetUrl != null) {
			response.sendRedirect(response.encodeRedirectURL(targetUrl));
		} else {
			response.getWriter().print(
					"esta session se ha cerrado correctamente.");
			response.flushBuffer();
		}
		return;
		}
		chain.doFilter(request, response);
	}
	
    protected boolean requiresLogout(HttpServletRequest request, HttpServletResponse response) {
        String uri = request.getRequestURI();
        int pathParamIndex = uri.indexOf(';');

        if (pathParamIndex > 0) {
            // strip everything from the first semi-colon
            uri = uri.substring(0, pathParamIndex);
        }

        int queryParamIndex = uri.indexOf('?');

        if (queryParamIndex > 0) {
            // strip everything from the first question mark
            uri = uri.substring(0, queryParamIndex);
        }

        if ("".equals(request.getContextPath())) {
            return uri.endsWith(filterProcessesUrl);
        }

        return uri.endsWith(request.getContextPath() + filterProcessesUrl);
    }

	private void doLogout(HttpServletRequest request,
			HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		for (int i = 0; i < handlers.length; i++) {
			handlers[i].logout(request, response, auth);
		}
	}

	public void setSessionRegistry(SessionRegistry sessionRegistry) {
		this.sessionRegistry = sessionRegistry;
	}

	public SessionRegistry getSessionRegistry() {
		return sessionRegistry;
	}

	public void setHandlers(LogoutHandler[] handlers) {
		this.handlers = handlers;
	}

	public LogoutHandler[] getHandlers() {
		return handlers;
	}

}
