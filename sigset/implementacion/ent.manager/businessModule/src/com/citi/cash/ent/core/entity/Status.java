package com.citi.cash.ent.core.entity;

/**
 * User: Sebastian Aburto Mendez
 * Date: Sep 30, 2011
 * Time: 3:35:49 PM
 */
public enum Status {
    DISABLE,
    ENABLE;

    public String toString() {
        String string = super.toString();
        return string.toLowerCase();
    }
}
