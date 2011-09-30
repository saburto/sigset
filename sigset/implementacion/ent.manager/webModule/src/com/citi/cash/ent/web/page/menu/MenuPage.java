package com.citi.cash.ent.web.page.menu;

import com.citi.cash.ent.web.page.base.AbstractPage;
import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.list.ListItem;
import org.apache.wicket.markup.html.list.ListView;

import java.util.Arrays;
import java.util.List;


/**
 * This class generates the xml config to render the menu according the intranet template
 * User: Sebastian Aburto Mendez
 * Date: Sep 28, 2011
 * Time: 8:50:02 AM
 */
public class MenuPage extends AbstractPage {

    public final static String MENU_URL = "xml/menu-config.xml";
    private static final String MENU_ITEM = "menuItem";
    private static final String SUB_MENU_ITEM = "subMenuItem";

    public MenuPage() {
        Label titleLabel = new Label("titleApp");
        titleLabel.add(new SimpleAttributeModifier("alternateText", getString("ent.manager.title")));
        titleLabel.add(new SimpleAttributeModifier("href", getContextRoot()));
        add(titleLabel);
        add(new ListMenu(MENU_ITEM, SUB_MENU_ITEM, Arrays.asList(MenuItem.values())));

    }


    @Override
    public String getMarkupType() {
        return "xml";
    }

    private class ListMenu extends ListView<Menu> {

        private String idSubMenu;

        private ListMenu(String idMenu, List<? extends Menu> menus) {
            super(idMenu, menus);
            this.idSubMenu = null;
        }

        /**
         * Constructor to create a list of two level of menus
         *
         * @param idMenu    id of the first level of the menu
         * @param idSubMenu id of the second level of the menu
         * @param menus     list of menuitems
         * @parem context is mandatory to create the link url in the menu item
         */
        private ListMenu(String idMenu, String idSubMenu, List<? extends Menu> menus) {
            this(idMenu, menus);
            this.idSubMenu = idSubMenu;

        }

        @Override
        protected void populateItem(ListItem<Menu> item) {
            Menu menu = item.getModelObject();

            item.add(new SimpleAttributeModifier("name", getString(menu.getKey())));
            item.add(new SimpleAttributeModifier("link", getContextRoot() + '/' + menu.getUrl()));
            boolean hasRole = isUserInRoles(menu.getRoles());
            item.setVisible(hasRole);
            if (idSubMenu != null && menu.getSubMenu() != null) {
                item.add(new ListMenu(idSubMenu, Arrays.asList(menu.getSubMenu())));
            }

        }
    }

}
