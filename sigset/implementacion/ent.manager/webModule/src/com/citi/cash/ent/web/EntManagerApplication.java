package com.citi.cash.ent.web;


import com.citi.cash.ent.web.page.base.Home;
import com.citi.cash.ent.web.page.menu.Menu;
import com.citi.cash.ent.web.page.menu.MenuItem;
import com.citi.cash.ent.web.page.menu.MenuPage;
import org.apache.wicket.Page;
import org.apache.wicket.protocol.http.WebApplication;
import org.apache.wicket.spring.injection.annot.SpringComponentInjector;

/**
 * This class represents the wicket web application, all attributes and methods have application scope.
 * User: Sebastian Aburto Mendez
 * Date: Sep 27, 2011
 * Time: 11:23:38 AM
 */
public class EntManagerApplication extends WebApplication {


    @Override
    public void init() {
        super.init();

        mountMenu(MenuItem.values());
        mountBookmarkablePage(MenuPage.MENU_URL, MenuPage.class);

        addComponentInstantiationListener(new SpringComponentInjector(this));
    }

    /**
     * Mount a bookmarkable link to each section menu
     */
    private void mountMenu(Menu[] menus) {
        if (menus != null) {
            for (Menu menuItem : menus) {
                mountBookmarkablePage(menuItem.getUrl(), menuItem.getPageClass());
                mountMenu(menuItem.getSubMenu());
            }
        }

    }


    /**
     * Return the home page
     *
     * @return
     */
    @Override
    public Class<? extends Page> getHomePage() {
        return Home.class;
    }
}
