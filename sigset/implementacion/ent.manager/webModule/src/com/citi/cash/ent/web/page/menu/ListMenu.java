package com.citi.cash.ent.web.page.menu;

import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.list.ListItem;
import org.apache.wicket.markup.html.list.ListView;

import java.util.Arrays;
import java.util.List;

/**
 * Class to display a list of menu
 * User: Sebastian Aburto Mendez
 * Date: Sep 28, 2011
 * Time: 1:06:46 PM
 */
public class ListMenu extends ListView<Menu> {

    private String idSubMenu;
    private final String context;

    private ListMenu(String idMenu, List<? extends Menu> menus, String context) {
        super(idMenu, menus);
        this.context = context;
    }

    /**
     * Constructor to create a list of two level of menus
     *
     * @param idMenu    id of the first level of the menu
     * @param idSubMenu id of the second level of the menu
     * @param menus     list of menuitems
     * @parem context is mandatory to create the link url in the menu item
     */
    public ListMenu(String idMenu, String idSubMenu, List<? extends Menu> menus, String context) {
        this(idMenu, menus, context);
        this.idSubMenu = idSubMenu;

    }

    @Override
    protected void populateItem(ListItem<Menu> item) {
        Menu menu = item.getModelObject();
        item.add(new SimpleAttributeModifier("name", getString(menu.getKey())));
        item.add(new SimpleAttributeModifier("link", context + '/' + menu.getUrl()));
        if (idSubMenu != null && menu.getSubMenu() != null) {
            item.add(new ListMenu(idSubMenu, Arrays.asList(menu.getSubMenu()), context));
        }
    }


}
