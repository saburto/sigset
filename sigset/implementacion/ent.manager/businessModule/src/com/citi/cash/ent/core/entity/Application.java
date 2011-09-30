package com.citi.cash.ent.core.entity;

import java.io.Serializable;

/**
 * User: Sebastian Aburto Mendez
 * Date: Sep 30, 2011
 * Time: 2:40:07 PM
 */
public class Application implements Serializable {
    private Integer id;
    private String name;
    private String description;
    private Status status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
