package cl.sigti.sigset.servicios.autenticacion;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.concurrent.SessionInformation;
import org.springframework.security.authentication.concurrent.SessionRegistry;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.util.Assert;
import org.springframework.web.filter.GenericFilterBean;

public class SessionControllerFiltro extends GenericFilterBean {
    private SessionRegistry sessionRegistry;
    private String expiredUrl = "/login/";
    private LogoutHandler[] handlers = new LogoutHandler[] {new SecurityContextLogoutHandler()};


    public SessionRegistry getSessionRegistry() {
		return sessionRegistry;
	}

	public void setSessionRegistry(SessionRegistry sessionRegistry) {
		this.sessionRegistry = sessionRegistry;
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);

        if (session != null) {
            SessionInformation info = sessionRegistry.getSessionInformation(session.getId());

            if (info != null) {
                if (info.isExpired()) {
                    // Expired - abort processing
                    doLogout(request, response);

                    String targetUrl = determineExpiredUrl(request, info);

                    if (targetUrl != null) {
                        targetUrl = request.getContextPath() + targetUrl;
                        response.sendRedirect(response.encodeRedirectURL(targetUrl));
                    } else {
                        response.getWriter().print("This session has been expired (possibly due to multiple concurrent " +
                                "logins being attempted as the same user).");
                        response.flushBuffer();
                    }

                    return;
                } else {
                    // Non-expired - update last request date/time
                    info.refreshLastRequest();
                }
            }
        }

        chain.doFilter(request, response);
    }

    protected String determineExpiredUrl(HttpServletRequest request, SessionInformation info) {
        return expiredUrl;
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        for (int i = 0; i < handlers.length; i++) {
            handlers[i].logout(request, response, auth);
        }
    }

    public void setExpiredUrl(String expiredUrl) {
        this.expiredUrl = expiredUrl;
    }

    
    public void setLogoutHandlers(LogoutHandler[] handlers) {
        Assert.notNull(handlers);
        this.handlers = handlers;
    }
}
