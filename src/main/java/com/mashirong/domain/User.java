package com.mashirong.domain;

public class User {
    private Integer userid;

    private String phonenum;

    private String username;

    private String password;

    private String address;

    private String email;

    private Boolean isseller = false;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Boolean getIsseller() {
        return isseller;
    }

    public void setIsseller(Boolean isseller) {
        this.isseller = isseller;
    }

	@Override
	public String toString() {
		return "User [userid=" + userid + ", phonenum=" + phonenum + ", username=" + username + ", password=" + password
				+ ", address=" + address + ", email=" + email + ", isseller=" + isseller + "]";
	}
    
}