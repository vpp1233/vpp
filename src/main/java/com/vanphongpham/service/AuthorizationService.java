package com.vanphongpham.service;

import com.vanphongpham.util.RoleConstants;

public class AuthorizationService {
    public boolean author(String role, String path) {
        if (RoleConstants.ADMIN.equals(role) && ((path.startsWith("/admin")) || (path.startsWith("/home") || path.startsWith("/")))) {
            return true;
        } else if ((RoleConstants.GUEST.equals(role) || RoleConstants.USER.equals(role)) && (path.startsWith("/web") || path.startsWith("/home"))) {
            return true;
        }
        return false;
    }
}