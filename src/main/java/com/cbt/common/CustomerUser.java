package com.cbt.common;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomerUser extends User {

    private String roleName;
    private String fullName;

    public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	private String deptName;

    public CustomerUser(String username, String password,
            Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

  
    public String getRoleName() {
		return roleName;
	}


	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}


	public String getDeptName() {
        return deptName;
    }


    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    private static final long serialVersionUID = 5869301720811314860L;
}
