package com.citi.cash.ent.web.page.menu;

import com.citi.cash.ent.web.page.application.ApplicationCreatePage;
import com.citi.cash.ent.web.page.application.ApplicationViewPage;
import com.citi.cash.ent.web.page.entitlement.EntitlementCreatePage;
import com.citi.cash.ent.web.page.entitlement.EntitlementSearchPage;
import com.citi.cash.ent.web.page.role.RoleCreatePage;
import com.citi.cash.ent.web.page.role.RoleSearchPage;
import com.citi.cash.ent.web.page.user.UserCreatePage;
import com.citi.cash.ent.web.page.user.UserSearchPage;
import org.apache.wicket.markup.html.WebPage;

/**
 * This class represents all sub menus
 * User: Sebastian Aburto Mendez
 * Date: Sep 28, 2011
 * Time: 11:19:14 AM
 */
public enum SubMenu implements Menu {

    //TODO: Remove the comment when audit section is completed

    APPLICATION_VIEW(ApplicationViewPage.class, "application/view", "view", Role.ENTOPER, Role.ENTTMNT),
    APPLICATION_CREATE(ApplicationCreatePage.class, "application/create", "create", Role.ENTTMNT),
    //APPLICATION_AUDIT( ApplicationAuditPage.class, "application/audit", "audit", Role.ENTOPER,Role.ENTTMNT ),

    ROLE_VIEW(RoleSearchPage.class, "role/view", "view", Role.ENTOPER, Role.ENTTMNT),
    ROLE_CREATE(RoleCreatePage.class, "role/create", "create", Role.ENTTMNT),
    //ROLE_AUDIT(  RoleAuditPage.class,  "role/audit",  "audit", Role.ENTOPER,  Role.ENTTMNT),

    ENTITLEMENT_VIEW(EntitlementSearchPage.class, "entitlement/view", "view", Role.ENTOPER, Role.ENTTMNT),
    ENTITLEMENT_CREATE(EntitlementCreatePage.class, "entitlement/create", "create", Role.ENTTMNT),
    //ENTITLEMENT_AUDIT(  EntitlementAuditPage.class,  "entitlement/audit",  "audit", Role.ENTOPER, Role.ENTTMNT),


    USER_VIEW(UserSearchPage.class, "user/view", "view", Role.ENTOPER, Role.ENTMAKE, Role.ENTVALI),
    USER_CREATE(UserCreatePage.class, "user/create", "create", Role.ENTMAKE),
    //USER_AUDIT(  ApplicationAuditPage.class,  "user/audit",  "audit", Role.ENTOPER, Role.ENTMAKE, Role.ENTVALI)
    ;

    private final Class<? extends WebPage> pageClass;
    private final String url;
    private final String key;
    private final Role[] roles;

    /**
     * Constructor to create the enums with attributes
     *
     * @param pageClass the wicket page class to render
     * @param url       the mounted url
     * @param key       the resource key to be showed as label in the rendered link
     * @param roles     the roles allowed to view the link an the page
     */
    private SubMenu(Class<? extends WebPage> pageClass, String url, String key, Role... roles) {
        this.pageClass = pageClass;
        this.url = url;
        this.key = key;
        this.roles = roles;
    }


    /**
     * the wicket page class to render
     *
     * @return
     */
    public Class<? extends WebPage> getPageClass() {
        return pageClass;
    }

    /**
     * mounted url
     *
     * @return
     */
    public String getUrl() {
        return url;
    }


    /**
     * the resource key to be showed as label in the rendered link
     *
     * @return
     */
    public String getKey() {
        return key;
    }

    /**
     * The menu has only two levels
     *
     * @return
     */
    public Menu[] getSubMenu() {
        return null;
    }

    /**
     * the roles allowed to view the link an the page
     *
     * @return
     */
    public Role[] getRoles() {
        return roles;
    }


}
