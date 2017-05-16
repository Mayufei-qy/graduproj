package com.mashirong.domain;

public class Admin {
    private Integer adminid;

    private String adminname;

    private String adminpswd;

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname == null ? null : adminname.trim();
    }

    public String getAdminpswd() {
        return adminpswd;
    }

    public void setAdminpswd(String adminpswd) {
        this.adminpswd = adminpswd == null ? null : adminpswd.trim();
    }

	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", adminname=" + adminname + ", adminpswd=" + adminpswd + "]";
	}
}