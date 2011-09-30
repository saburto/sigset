package com.citi.cash.ent.web.page.base;

import com.citi.cash.ent.web.page.menu.MenuPage;
import org.apache.wicket.markup.html.basic.Label;

/**
 * This class representent the common layout of the application
 * User: Sebastian Aburto Mendez
 * Date: Sep 27, 2011
 * Time: 11:43:55 AM
 */
public abstract class LayoutPage extends AbstractPage {

    protected abstract String getSectionTitleKey();

    public LayoutPage() {
        loadComponents();
    }

    /**
     * if the html page doesn't extends of the PageBase it must override this method
     */
    protected void loadComponents() {
        addXmlConfig();
        addTitle();
    }

    private void addTitle() {
        String sectionTitle = getSectionTitleKey();
        String title = sectionTitle != null ? getString(sectionTitle) : "";
        add(new Label("titlePage", title));
        add(new Label("siteTitle", title));
    }

    /**
     * This method add the new label into the head of the page
     */
    private void addXmlConfig() {
        StringBuilder builder = new StringBuilder("var xmlConfig ='");
        builder.append(getContextRoot());
        builder.append('/');
        builder.append(getXMLConfig());
        builder.append("';");
        Label label = new Label("xmlConfig", builder.toString());
        add(label.setEscapeModelStrings(false));
    }

    /**
     * Get the default menu configuration
     *
     * @return
     */
    protected String getXMLConfig() {
        return MenuPage.MENU_URL;
    }


}
