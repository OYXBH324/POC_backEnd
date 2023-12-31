package com.demo.filter;

/**
 * @author 11214
 * @since 2022/11/23 17:19
 */
public class SecurityContextHolder {
    private static final SecurityContextContainer container;

    static {
        container = new SecurityContextContainer();
    }

    public static void clearContext() {
        container.clearContext();
    }

    public static SecurityContext getContext() {
        return container.getContext();
    }

    public static void setContext(SecurityContext context) {
        container.setContext(context);
    }

    public static SecurityContext createEmptyContext() {
        return container.createEmptyContext();
    }
}
