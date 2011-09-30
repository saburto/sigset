package com.citi.cash.ent.web.page.base;

import com.citi.cash.ent.web.page.menu.Role;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.protocol.http.WebRequest;
import org.apache.wicket.protocol.http.WebRequestCycle;

import javax.servlet.http.HttpServletRequest;

/**
 * User: Sebastian Aburto Mendez
 * Date: Sep 28, 2011
 * Time: 5:04:13 PM
 */
public abstract class AbstractPage extends WebPage {
    /**
     * Get the context root of the application
     *
     * @return
     */
    protected String getContextRoot() {
        HttpServletRequest request = getHttpServletRequest();
        return request.getContextPath();
    }

    /**
     * Gets the standar httpServletRequest Object
     *
     * @return
     */
    protected HttpServletRequest getHttpServletRequest() {
        WebRequestCycle requestCycle = getWebRequestCycle();
        WebRequest webRequest = requestCycle.getWebRequest();
        return webRequest.getHttpServletRequest();
    }

    /**
     * Evaluates if user has the role
     *
     * @param role
     * @return
     */
    protected boolean isUserInRole(Role role) {
        boolean hasRole = false;
        HttpServletRequest servletRequest = getHttpServletRequest();
        if (role != null) {
            hasRole = servletRequest.isUserInRole(role.toString());
        }
        //TODO: Delete true to validate the role
        return hasRole || true;
    }

    /**
     * Evaluates if user has at least one of the roles
     *
     * @param role
     * @return
     */
    protected boolean isUserInRoles(Role... roles) {
        boolean hasRole = false;
        if (roles != null) {
            for (Role role : roles) {
                hasRole = isUserInRole(role);
                if (hasRole) {
                    break;
                }
            }
        }
        return hasRole;
    }
}
