package com.demo.filter;


import com.demo.model.po.system.User;

/**
 * @author 11214
 * @since 2022/11/23 17:13
 */
public class SecurityContext {
    private User user;

    public SecurityContext() {
    }

    public SecurityContext(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
