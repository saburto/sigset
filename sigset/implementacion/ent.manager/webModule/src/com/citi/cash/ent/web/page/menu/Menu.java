package com.citi.cash.ent.web.page.menu;

import org.apache.wicket.markup.html.WebPage;

/**
 * Represents the main method must have any menu
 * User: Sebastian Aburto Mendez
 * Date: Sep 28, 2011
 * Time: 1:10:09 PM
 */
public interface Menu {

    /**
     * Get the wicket page class
     * @return
     */
    Class<? extends WebPage> getPageClass();

    /**
     * Get the url bookmarkable mounted
     * @return
     */
    String getUrl();

    /**
     * Get the key in the resource bundle
     * @return
     */
    String getKey();

    /**
     * Get the list of sub menus
     * @return
     */
    Menu[] getSubMenu();

    /**
     * Get all roles authorized to view this menu 
     * @return
     */
    Role[] getRoles();

}
