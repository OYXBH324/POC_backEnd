package com.demo.filter;

/**
 * @author 11214
 * @since 2022/11/23 17:14
 */
public class SecurityContextContainer {
    private static final ThreadLocal<SecurityContext> contextHolder = new ThreadLocal<>();

    public void clearContext() {
        contextHolder.remove();
    }

    public SecurityContext getContext() {
        SecurityContext context = contextHolder.get();

        if (context == null) {
            context = createEmptyContext();
            contextHolder.set(context);
        }

        return context;
    }

    public void setContext(SecurityContext context) {
        contextHolder.set(context);
    }

    public SecurityContext createEmptyContext() {
        return new SecurityContext();
    }
}
