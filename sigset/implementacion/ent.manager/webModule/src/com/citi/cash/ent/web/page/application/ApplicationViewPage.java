package com.citi.cash.ent.web.page.application;

import com.citi.cash.ent.core.entity.Application;
import com.citi.cash.ent.core.service.application.ApplicationService;
import org.apache.log4j.Logger;
import org.apache.wicket.PageParameters;
import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.list.ListItem;
import org.apache.wicket.markup.html.list.ListView;
import org.apache.wicket.markup.html.list.PropertyListView;
import org.apache.wicket.model.Model;
import org.apache.wicket.spring.injection.annot.SpringBean;

/**
 * User: Sebastian Aburto Mendez
 * Date: Sep 27, 2011
 * Time: 3:03:23 PM
 */
public class ApplicationViewPage extends ApplicationPage {

    private final static Logger logger = Logger.getLogger(ApplicationViewPage.class);

    @SpringBean
    private ApplicationService applicationService;

    public ApplicationViewPage(PageParameters pageParameters) {
        this();
        String id = pageParameters.getString("id");
        logger.info("Id of application " + String.valueOf(id));
    }

    public ApplicationViewPage() {


        ListView listView = new PropertyListView<Application>("applicationTable", applicationService.getApplications()) {
            protected void populateItem(ListItem<Application> applicationListItem) {


                int index = applicationListItem.getIndex();
                String className = index % 2 == 0 ? "columnEven" : "";
                applicationListItem.add(new SimpleAttributeModifier("class", className));

                Application application = applicationListItem.getModelObject();
                Link<Application> link = new Link<Application>("name", new Model<Application>(application)) {
                    @Override
                    public void onClick() {

                        Application applicationLink = getModelObject();

                        PageParameters pageParameters = new PageParameters();
                        pageParameters.add("id", String.valueOf(applicationLink.getId()));
                        setResponsePage(ApplicationViewPage.class, pageParameters);
                    }
                };
                link.add(new Label("linkLabel", application.getName()));
                applicationListItem.add(link);
                applicationListItem.add(new Label("description"));
                applicationListItem.add(new Label("status", getString(String.valueOf(application.getStatus()))));
            }
        };

        add(listView);
    }


    @Override
    protected String getSectionTitleKey() {
        return "application.view.title";
    }
}
