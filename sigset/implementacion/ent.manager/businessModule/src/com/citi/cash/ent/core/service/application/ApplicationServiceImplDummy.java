package com.citi.cash.ent.core.service.application;

import com.citi.cash.ent.core.entity.Application;
import com.citi.cash.ent.core.entity.Status;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * User: Sebastian Aburto Mendez
 * Date: Sep 30, 2011
 * Time: 2:47:55 PM
 */
@Service
public class ApplicationServiceImplDummy implements ApplicationService {

    public List<Application> getApplications() {

        Application application = new Application();
        application.setId(1);
        application.setName("TAX");
        application.setDescription("Tax presenment");
        application.setStatus(Status.ENABLE);

        Application application2 = new Application();
        application2.setId(99);
        application2.setName("PCC");
        application2.setDescription("Citi Connect");
        application2.setStatus(Status.DISABLE);

        return Arrays.asList(application, application2);
    }
}
