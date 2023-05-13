package com.example.internet_shop.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_USER;

    public String getAuthority() {
        return name();
    }
}
