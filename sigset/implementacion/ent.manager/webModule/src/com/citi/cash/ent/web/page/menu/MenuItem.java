package com.citi.cash.ent.web.page.menu;

import com.citi.cash.ent.web.page.application.ApplicationViewPage;
import com.citi.cash.ent.web.page.entitlement.EntitlementSearchPage;
import com.citi.cash.ent.web.page.role.RoleSearchPage;
import com.citi.cash.ent.web.page.user.UserSearchPage;
import org.apache.wicket.markup.html.WebPage;

/**
 * Enum class to specific each of the menu items and theirs submenu
 * User: Sebastian Aburto Mendez
 * Date: Sep 28, 2011
 * Time: 9:08:42 AM
 */
public enum MenuItem implements Menu {
    APPLICATION(ApplicationViewPage.class, "application/", "application",
            new Role[]{Role.ENTOPER, Role.ENTTMNT},
            SubMenu.APPLICATION_VIEW,
            SubMenu.APPLICATION_CREATE
            //,SubMenu.APPLICATION_AUDIT
    ),
    ROLE(RoleSearchPage.class, "role/", "role",
            new Role[]{Role.ENTOPER, Role.ENTTMNT},
            SubMenu.ROLE_VIEW,
            SubMenu.ROLE_CREATE
            //,SubMenu.ROLE_AUDIT
    ),
    ENTITLEMENT(EntitlementSearchPage.class, "entitlement/", "entitlement",
            new Role[]{Role.ENTOPER, Role.ENTTMNT},
            SubMenu.ENTITLEMENT_VIEW,
            SubMenu.ENTITLEMENT_CREATE
            //,SubMenu.ENTITLEMENT_AUDIT
    ),
    USERS(UserSearchPage.class, "users/", "users",
            new Role[]{Role.ENTOPER, Role.ENTMAKE, Role.ENTVALI},
            SubMenu.USER_VIEW,
            SubMenu.USER_CREATE
            //,SubMenu.USER_AUDIT
    );

    private final Class<? extends WebPage> pageClass;
    private final String url;
    private final String key;
    private Menu[] subMenu;
    private Role[] roles;

    /**
     * Constructor to specific the attributes of the menu enum
     *
     * @param pageClass the wicket page to render
     * @param url       the bookmarkable url
     * @param key       the resource key of the label
     * @param roles     the roles allowed
     * @param subMenu   and list of submenus
     */
    private MenuItem(Class<? extends WebPage> pageClass, String url, String key, Role[] roles, SubMenu... subMenu) {
        this.pageClass = pageClass;
        this.url = url;
        this.key = key;
        this.subMenu = subMenu;
        this.roles = roles;
    }

    public Class<? extends WebPage> getPageClass() {
        return pageClass;
    }

    public String getUrl() {
        return url;
    }

    public String getKey() {
        return key;
    }

    public Menu[] getSubMenu() {
        return subMenu;
    }

    public Role[] getRoles() {
        return roles;
    }

    public void setSubMenu(Menu[] subMenu) {
        this.subMenu = subMenu;
    }
}
